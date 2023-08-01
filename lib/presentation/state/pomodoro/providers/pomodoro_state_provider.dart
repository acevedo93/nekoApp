




import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/presentation/state/pomodoro/notifiers/pomodoro_state_notifier.dart';
import 'package:nekonapp/presentation/state/pomodoro/pomodoro_state_notifier.dart';

final pomodoroStateProvider = StateNotifierProvider<PomodoroStateNotifier,PomodoroState>((_) => PomodoroStateNotifier());