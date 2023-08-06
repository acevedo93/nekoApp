import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/domain/datasources/models/user_settings_model.dart';
import 'package:nekonapp/presentation/state/user/provider/settings_provider.dart';
import 'package:nekonapp/presentation/widgets/pomodoroSettings/pomodoro_settings_control.dart';

class PomodoroSettings extends ConsumerWidget {
  const PomodoroSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsValues = ref.watch(settingsProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          PomodoroSettingsControl<double>(
              initialvalue: settingsValues!.breakDuration.inMinutes / 100 ,
              controlType: ControlType.slider,
              label: "Pomodoro Time",
              ),
          // PomodoroSettingsControl<double>(
          //     initialvalue: getValue((settings) => settings.breakDuration),
          //     controlType: ControlType.slider,
          //     label: "Break Time"),
          // PomodoroSettingsControl<bool>(
          //   initialvalue: getValue((settings) => settings.startBreakAuto),
          //     controlType: ControlType.toogle, label: "Start Pomo auto"),
          // PomodoroSettingsControl<bool>(
          //   controlType: ControlType.toogle,
          //   label: "Start break auto",
          // ),
          // PomodoroSettingsControl<bool>(
          //   controlType: ControlType.toogle,
          //   label: "Vibrate",
          // ),
        ],
      ),
    );
  }
}
