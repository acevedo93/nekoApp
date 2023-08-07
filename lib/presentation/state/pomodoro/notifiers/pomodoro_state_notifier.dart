import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/domain/datasources/models/pomodoro_model.dart';
import 'package:nekonapp/domain/datasources/models/user_settings_model.dart';
import 'package:nekonapp/infrastructure/datasources/firebase/firebase_auth_datasource_impl.dart';
import 'package:nekonapp/infrastructure/datasources/firebase/firebase_pomodoro_datasource_impl.dart';
import 'package:nekonapp/infrastructure/datasources/firebase/firebase_user_datasource_impl.dart';
import 'package:nekonapp/infrastructure/repositories/auth_repository_impl.dart';
import 'package:nekonapp/infrastructure/repositories/pomodoro_repository_impl.dart';
import 'package:nekonapp/infrastructure/repositories/user_repository_impl.dart';
import '../pomodoro_state.dart';

class PomodoroStateNotifier extends StateNotifier<PomodoroState> {
  final _pomodoroRepository =
      PomodoroRepositoryImpl(dataSource: FirebasePomodoroDatasourceImpl());
  final _auth =
      AuthRepositoryImpl(authDataSource: FirebaseAuthDataSourceImpl());
  final _userSettings =
      UserRepositoryImpl(datasource: FirebaseUserDataSourceImpl());

  PomodoroStateNotifier() : super(const PomodoroState.unknown()) {
    if (_auth.isAlreadyLoggedIn) {
      _userSettings.getSettingsById(_auth.userId!).then((settingPomo) {
        final pomoTimevalue = settingPomo.pomoDuration ?? 25;
        final pomoTimeMin = settingPomo.breakDuration ?? 5;

        state = PomodoroState(
            isLoading: false,
            isPomoActive: false,
            pomoTimeMin: pomoTimevalue,
            pomoTimeSec: 0,
            breakTimeMin: pomoTimeMin,
            status: PomodoroStatus.work);
      });
    }
  }

  Timer buildTimer() {
    return Timer.periodic(state.periodicRepeat, buildpomodoroMachine);
  }

  void buildpomodoroMachine(Timer timer) {
    var localPomoTimeMin = state.pomoTimeMin;
    var localPomoTimeSec = state.pomoTimeSec;
    var isPomoActive = state.isPomoActive;

    if (localPomoTimeMin == 0 && localPomoTimeSec == 0) {
      finishTimer();
      return timer.cancel();
    }
    if (localPomoTimeSec == 0) {
      localPomoTimeSec = 59;
      localPomoTimeMin--;
    } else {
      localPomoTimeSec--;
    }
    isPomoActive = true;
    state = state.copyWith(
        pomoTimeMin: localPomoTimeMin,
        pomoTimeSec: localPomoTimeSec,
        timerRef: timer,
        isPomoActive: isPomoActive);
  }

  void play() {
    buildTimer();
  }

  void stop() {
    if (state.timerRef!.isActive) {
      state.timerRef!.cancel();
      state = state.copyWith(isPomoActive: false);
    }
  }

  void finishTimer() async {
    try {
      final userId = _auth.userId;
      state = state.copyWith(isPomoActive: false);
      final pomodoroModel = PomodoroModel(
          completed: true,
          status: state.status!,
          startTime: DateTime.now(),
          endTime: DateTime.now(),
          userId: userId!,
          duration: state.status == PomodoroStatus
              ? state.pomoTimeMin
              : state.breakTimeMin);
      changeStatus();
      await _pomodoroRepository.savePomodoro(pomodoroModel);
    } catch (err) {
      //fix this error
      print(err);
    }
  }

  void changeStatus() {
    final PomodoroStatus nextStatus = state.status == PomodoroStatus.work
        ? PomodoroStatus.shortBreak
        : PomodoroStatus.work;
    final nextTimeMin = nextStatus == PomodoroStatus.work
        ? state.pomoTimeMin
        : state.breakTimeMin;
    const nextTimeSec = 0;

    state = state.copyWith(
        status: nextStatus, pomoTimeMin: nextTimeMin, pomoTimeSec: nextTimeSec);
  }

  void updateSettings(UserSettingsModel data) {
    state = state.copyWith(
        pomoTimeMin: data.pomoDuration, breakTimeMin: data.breakDuration);
  }
}
