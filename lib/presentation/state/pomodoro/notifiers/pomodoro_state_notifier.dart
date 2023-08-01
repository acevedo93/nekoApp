import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/presentation/state/pomodoro/pomodoro_state_notifier.dart';

class PomodoroStateNotifier extends StateNotifier<PomodoroState> {
  PomodoroStateNotifier() : super(const PomodoroState.unknown()) {
    state = const PomodoroState(
        isLoading: false, isPomoActive: false, pomoTimeMin: 25, pomoTimeSec: 0);
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

  // Future<void> restart() {

  // }

  void finishTimer() {}
}
