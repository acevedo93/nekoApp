import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/domain/datasources/models/user_settings_model.dart';
import 'package:nekonapp/presentation/state/pomodoro/providers/pomodoro_state_provider.dart';
import 'package:nekonapp/presentation/state/user/provider/settings_provider.dart';
import 'package:nekonapp/presentation/state/user/provider/user_state_provider.dart';
import 'package:nekonapp/presentation/widgets/pomodoroSettings/pomodoro_settings_control.dart';

class PomodoroSettings extends ConsumerWidget {
  const PomodoroSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsValues = ref.watch(settingsProvider);
    final changeValue = ref.read(userStateProvider.notifier).updateSettingsByValue;

    //update pomodoro clock
    ref.listen(settingsProvider, ( prev,next) => {
      if(prev?.pomoDuration != next?.pomoDuration || prev?.breakDuration != next?.breakDuration)
      ref.read(pomodoroStateProvider.notifier).updateSettings(next!)
    });

    return SingleChildScrollView(
      child: Column(
        children: [
          PomodoroSettingsControl<double>(
            onChanged: (value) => changeValue( SettingsKeys.pomoDuration, value.toInt()),
            initialvalue:( settingsValues?.pomoDuration ?? 25) / 100,
            controlType: ControlType.slider,
            minValue: 15,
            maxValue: 45,
            label: "Pomodoro Time",
          ),
          PomodoroSettingsControl<double>(
              onChanged: (value) => changeValue(SettingsKeys.breakDuration, value.toInt()),
              initialvalue: (settingsValues?.breakDuration ?? 5) / 100,
              controlType: ControlType.slider,
              minValue: 5,
              maxValue: 25,
              label: "Break Time"),
          PomodoroSettingsControl<bool>(
            onChanged: (value) => changeValue(SettingsKeys.startPomoAuto, value),
              initialvalue: settingsValues?.startPomoAuto ?? false,
              controlType: ControlType.toogle,
              label: "Start Pomo auto"),
          PomodoroSettingsControl<bool>(
            onChanged: (value) => changeValue(SettingsKeys.startBreakAuto, value),
            initialvalue: settingsValues?.startBreakAuto ?? false,
            controlType: ControlType.toogle,
            label: "Start break auto",
          ),
          PomodoroSettingsControl<bool>(
            onChanged: (value) => changeValue(SettingsKeys.vibrate, value),
            initialvalue: settingsValues?.vibrate ?? false,
            controlType: ControlType.toogle,
            label: "Vibrate",
          ),
          
        ],
      ),
    );
  }
}
