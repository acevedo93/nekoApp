import 'package:nekonapp/domain/datasources/models/user_model.dart';

typedef PomodoroId = String;

enum PomodoroStatus {
  work,
  shortBreak,
  longBreak,
}

class PomodoroModel {
  final UserId userId;
  final Duration duration;
  final PomodoroStatus status;
  final DateTime startTime;
  final DateTime endTime;
  final bool completed;

  const PomodoroModel(
      {required this.userId,
      required this.duration,
      required this.status,
      required this.startTime,
      required this.endTime,
      required this.completed});

  factory PomodoroModel.fromJson(Map<String, dynamic>? json) => PomodoroModel(
      userId: json?['user_id'],
      duration: Duration(minutes: json?['duration']),
      status: getPomodoroStatusFromString(json?['status']),
      startTime: json?['start_time'],
      endTime: json?['end_time'],
      completed: json?['completed']);

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "duration": duration.toString(),
        "status": statusString,
        "start_time": startTime,
        "end_time": endTime,
        "completed": completed
      };

  get statusString {
    switch (status) {
      case PomodoroStatus.work:
        return "work";
      case PomodoroStatus.shortBreak:
        return "short_Break";
      case PomodoroStatus.longBreak:
        return "long_Break";
    }
  }

  static PomodoroStatus getPomodoroStatusFromString(String statusString) {
    switch (statusString) {
      case "work":
        return PomodoroStatus.work;
      case "short_Break":
        return PomodoroStatus.shortBreak;
      case "long_Break":
        return PomodoroStatus.longBreak;
      default:
        throw Exception("Invalid PomodoroStatus value: $statusString");
    }
  }
}
