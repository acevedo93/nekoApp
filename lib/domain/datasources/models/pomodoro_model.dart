

import 'package:nekonapp/domain/datasources/models/user_model.dart';
typedef PomodoroId = String;
enum PomodoroStatus {
  work,
  shortBreak,
  longBreak,
}

class PomodoroModel {
  final UserId userId;
  final int duration;
  final String status;
  final DateTime startTime;
  final DateTime endTime;
  final bool completed;


  const PomodoroModel({required this.userId, required this.duration, required this.status, required this.startTime, required this.endTime, required this.completed});

    factory PomodoroModel.fromJson(Map<String, dynamic>? json) => PomodoroModel(
      userId: json?['user_id'],
      duration: json?['duration'],
      status: json?['status'],
      startTime: json?['start_time'],
      endTime: json?['end_time'],
      completed: json?['completed']
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "duration": duration,
        "status": status,
        "start_time": startTime,
        "end_time": endTime,
        "completed": completed
      };  

  
}