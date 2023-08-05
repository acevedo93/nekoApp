import 'package:equatable/equatable.dart';

typedef UserId = String;

class UserSettingsModel extends Equatable {
  final Duration breakDuration;
  final Duration pomoDuration;
  final bool startBreakAuto;
  final bool startPomoAuto;
  final bool vibrate;

  const UserSettingsModel(
      {
      required this.breakDuration,
      required this.pomoDuration,
      required this.startBreakAuto,
      required this.startPomoAuto,
      required this.vibrate
      });

  factory UserSettingsModel.fromJson(Map<String, dynamic>? json) => UserSettingsModel(


      breakDuration: Duration(minutes:25),
      pomoDuration: Duration(minutes: 25),
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
