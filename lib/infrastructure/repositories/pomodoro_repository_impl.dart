
import 'package:nekonapp/domain/datasources/models/pomodoro_model.dart';

import 'package:nekonapp/domain/datasources/models/user_model.dart';
import 'package:nekonapp/domain/datasources/pomodoro_datasource.dart';

import '../../domain/repositories/pomodoro_repository.dart';

class PomodoroRepositoryImpl extends PomodoroRepository {

  final PomodoroDataSource dataSource;

  PomodoroRepositoryImpl({required this.dataSource});
  @override
  Future<List<PomodoroModel>> getAllPomodorosByUser(UserId userId) {
    return dataSource.getAllPomodorosByUser(userId);
  }

  @override
  Future<void> savePomodoro(PomodoroModel pomodoro) {
    return dataSource.savePomodoro(pomodoro);
  }

  @override
  Future<void> updatePomodoro(PomodoroId pomodoroId, PomodoroModel pomodoro) {
    return dataSource.updatePomodoro(pomodoroId, pomodoro);

  }


}