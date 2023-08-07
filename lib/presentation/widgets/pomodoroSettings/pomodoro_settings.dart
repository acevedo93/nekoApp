import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/domain/datasources/models/user_settings_model.dart';
import 'package:nekonapp/presentation/state/user/provider/settings_provider.dart';
import 'package:nekonapp/presentation/state/user/provider/user_state_provider.dart';
import 'package:nekonapp/presentation/widgets/pomodoroSettings/pomodoro_settings_control.dart';

class PomodoroSettings extends ConsumerWidget {
  const PomodoroSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsValues = ref.watch(settingsProvider);

    changeValue<T>( T value, label ) {
  
      if(label == 'pomo_duration') {
        print(value);
         final settingsToUpdate = UserSettingsModel(
          breakDuration: Duration(minutes: 7),
          pomoDuration: Duration(minutes: 23 ),
          startBreakAuto: value as bool,
          startPomoAuto: value as bool,
          vibrate: value as bool
          );
            ref.read(userStateProvider.notifier).updateSettings(
        settingsToUpdate
      );
      }
    
    };

    return SingleChildScrollView(
      child: Column(
        children: [
          PomodoroSettingsControl<double>(
            onChanged: (value) => changeValue<double>(value, "pomo_duration"),
            initialvalue:( settingsValues?.pomoDuration.inMinutes ?? 25) / 100,
            controlType: ControlType.slider,
            label: "Pomodoro Time",
          ),
          PomodoroSettingsControl<double>(
              onChanged: (value) => print(value),
              initialvalue: (settingsValues?.breakDuration.inMinutes ?? 5) / 100,
              controlType: ControlType.slider,
              label: "Break Time"),
          PomodoroSettingsControl<bool>(
            onChanged: (value) => changeValue<bool>(value, "pomo_duration"),
              initialvalue: settingsValues?.startPomoAuto ?? false,
              controlType: ControlType.toogle,
              label: "Start Pomo auto"),
          PomodoroSettingsControl<bool>(
            onChanged: (value) => print(value),
            initialvalue: settingsValues?.startBreakAuto ?? false,
            controlType: ControlType.toogle,
            label: "Start break auto",
          ),
          PomodoroSettingsControl<bool>(
            onChanged: (value) => print(value),
            initialvalue: settingsValues?.vibrate ?? false,
            controlType: ControlType.toogle,
            label: "Vibrate",
          ),
        ],
      ),
    );
  }
}
