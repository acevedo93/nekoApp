import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/domain/datasources/models/pomodoro_model.dart';
import 'package:nekonapp/infrastructure/datasources/firebase/firebase_auth_datasource_impl.dart';
import 'package:nekonapp/infrastructure/datasources/firebase/firebase_pomodoro_datasource_impl.dart';
import 'package:nekonapp/infrastructure/repositories/auth_repository_impl.dart';
import 'package:nekonapp/infrastructure/repositories/pomodoro_repository_impl.dart';
import '../pomodoro_state.dart';

class PomodoroStateNotifier extends StateNotifier<PomodoroState> {
  final _pomodoroRepository =
      PomodoroRepositoryImpl(dataSource: FirebasePomodoroDatasourceImpl());
  final _auth =
      AuthRepositoryImpl(authDataSource: FirebaseAuthDataSourceImpl());
  PomodoroStateNotifier() : super(const PomodoroState.unknown()) {
    state = const PomodoroState(
        isLoading: false,
        isPomoActive: false,
        pomoTimeMin: 1,
        pomoTimeSec: 0,
        status: PomodoroStatus.work);
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
          duration: Duration(minutes: 25));
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
    final nextTimeMin = nextStatus == PomodoroStatus.work ? 25 : 5;
    const nextTimeSec = 0;

    state = state.copyWith(
      status: nextStatus,
      pomoTimeMin:  nextTimeMin,
      pomoTimeSec: nextTimeSec
    );
  } 
}
