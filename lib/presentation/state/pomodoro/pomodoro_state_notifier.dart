import 'dart:async';
import 'package:equatable/equatable.dart';

class PomodoroState extends Equatable {
  final bool isPomoActive;
  final bool isLoading;
  final int pomoTimeMin;
  final int pomoTimeSec;
  final Timer? timerRef;
  final Duration periodicRepeat = const Duration(seconds: 1);

  const PomodoroState({
    required this.isLoading,
    required this.isPomoActive,
    required this.pomoTimeMin,
    required this.pomoTimeSec,
    this.timerRef
  });

  const PomodoroState.unknown()
      : isPomoActive = false,
        isLoading = false,
        timerRef = null,
        pomoTimeMin = 25,
        pomoTimeSec = 0;

  PomodoroState copiedWithIsLoading(bool isLoading) => PomodoroState(
      isLoading: isLoading,
      isPomoActive: isPomoActive,
      timerRef: timerRef,
      pomoTimeMin: pomoTimeMin,
      pomoTimeSec: pomoTimeSec);
  PomodoroState copyWith({bool? isPomoActive, bool? isLoading, Timer? timerRef, int? pomoTimeMin, int? pomoTimeSec}) =>
      PomodoroState(
          isLoading: isLoading ?? this.isLoading,
          isPomoActive: isPomoActive ?? this.isPomoActive,
          timerRef: timerRef ?? this.timerRef,
          pomoTimeMin: pomoTimeMin ?? this.pomoTimeMin,
          pomoTimeSec: pomoTimeSec ?? this.pomoTimeSec);
  @override
  List<Object?> get props => [isLoading, isPomoActive, timerRef, pomoTimeMin,pomoTimeSec];
}
