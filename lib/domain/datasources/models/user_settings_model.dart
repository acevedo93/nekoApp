import 'package:equatable/equatable.dart';

typedef UserId = String;

enum SettingsKeys {
  breakDuration,
  pomoDuration,
  startBreakAuto,
  vibrate,
  startPomoAuto
}

extension SettingsKeyWithValue on SettingsKeys {
  String get value {
    switch (this) {
      case SettingsKeys.pomoDuration:
        return "pomo_duration";
      case SettingsKeys.breakDuration:
        return "break_duration";
      case SettingsKeys.startBreakAuto:
        return "start_break_auto";
      case SettingsKeys.vibrate:
        return "vibrate";
      case SettingsKeys.startPomoAuto:
        return "start_pomo_auto";
      default:
        return "";
    }
  }
}


class UserSettingsModel extends Equatable {
  final int breakDuration;
  final int pomoDuration;
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
      breakDuration: json?[SettingsKeys.breakDuration.value],
      pomoDuration: json?[SettingsKeys.pomoDuration.value],
      startBreakAuto: json?[SettingsKeys.startBreakAuto.value],
      startPomoAuto: json?[SettingsKeys.startPomoAuto.value],
      vibrate: json?[SettingsKeys.vibrate.value]
  );

  Map<String, dynamic> toJson() => {
        SettingsKeys.breakDuration.value: breakDuration,
        SettingsKeys.pomoDuration.value: pomoDuration,
        SettingsKeys.startBreakAuto.value: startBreakAuto,
        SettingsKeys.startPomoAuto.value: startPomoAuto,
        SettingsKeys.vibrate.value: vibrate
      };

  @override
  List<Object> get props => [breakDuration, pomoDuration, startBreakAuto, startPomoAuto, vibrate];
}
