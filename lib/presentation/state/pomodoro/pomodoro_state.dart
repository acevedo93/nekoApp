


import 'dart:async';

import 'package:equatable/equatable.dart';

class PomodoroState extends Equatable {
  final bool isPause;
  final bool isLoading;
  final Timer? timerRef;
  final Duration periodicRepeat = const Duration(seconds:1);

  const PomodoroState({
    required this.isLoading,
    required this.isPause,
    required this.timerRef,
  });

  const PomodoroState.unknown()
    : isPause = false,
      isLoading = false,
      timerRef = null;

  PomodoroState copiedWithIsLoading(bool isLoading) => PomodoroState(isLoading: isLoading, isPause: isPause, timerRef: timerRef);
  PomodoroState copyWith(bool? isPause, bool? isLoading, Timer? timerRef) => PomodoroState(isLoading: isLoading ?? this.isLoading, isPause: isPause ?? this.isPause, timerRef: timerRef ?? this.timerRef);
  @override
  List<Object?> get props => [isLoading,isPause,timerRef];
}