


import 'package:nekonapp/domain/datasources/models/pomodoro_model.dart';

import 'models/user_model.dart';

abstract class PomodoroDataSource {
  Future<List<PomodoroModel>> getAllPomodorosByUser(UserId userId);
  Future<void> savePomodoro(PomodoroModel pomodoro);
  Future<void> updatePomodoro(PomodoroId pomodoroId, PomodoroModel pomodoro);
}