import 'package:equatable/equatable.dart';

typedef UserId = String;

class UserSettings extends Equatable {
  final Duration breakDuration;
  final Duration pomoDuration;
  final bool startBreakAuto;
  final bool startPomoAuto;
  final bool vibrate;

  const UserSettings(
      {
      required this.breakDuration,
      required this.pomoDuration,
      required this.startBreakAuto,
      required this.startPomoAuto,
      required this.vibrate
      });

  factory UserSettings.fromJson(Map<String, dynamic>? json) => UserSettings(
      breakDuration: json?['break_duration'],
      pomoDuration: json?['pomo_duration'],
      startBreakAuto: json?['start_break_auto'],
      startPomoAuto: json?['start_pomo_auto'],
      vibrate: json?['vibrate']
  );

  Map<String, dynamic> toJson() => {
        "break_duration": breakDuration.toString(),
        "pomo_duration": pomoDuration.toString(),
        "start_break_auto": startBreakAuto,
        "start_pomo_auto": startPomoAuto,
        "vibrate": vibrate
      };

  @override
  List<Object> get props => [breakDuration, pomoDuration, startBreakAuto, startPomoAuto, vibrate];
}
