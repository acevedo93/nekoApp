import '../datasources/models/pomodoro_model.dart';
import '../datasources/models/user_model.dart';

abstract class PomodoroRepository {
  Future<List<PomodoroModel>> getAllPomodorosByUser(UserId userId);
  Future<void> savePomodoro(PomodoroModel pomodoro);
  Future<void> updatePomodoro(PomodoroId pomodoroId, PomodoroModel pomodoro);
}
