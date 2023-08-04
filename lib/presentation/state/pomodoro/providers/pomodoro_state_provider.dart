




import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/pomodoro_state_notifier.dart';
import '../pomodoro_state.dart';


final pomodoroStateProvider = StateNotifierProvider<PomodoroStateNotifier,PomodoroState>((_) => PomodoroStateNotifier());