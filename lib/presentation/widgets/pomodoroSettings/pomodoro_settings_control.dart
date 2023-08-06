import 'package:flutter/material.dart';

enum ControlType { slider, toogle }

class PomodoroSettingsControl<T> extends StatelessWidget {
  final ValueChanged<T>? onChanged;
  final T? initialvalue;
  final String label;
  final ControlType controlType;

  const PomodoroSettingsControl(
      {super.key,
      this.onChanged,
      this.initialvalue,
      required this.label,
      required this.controlType});




  Widget _renderControl() {
    if (controlType == ControlType.slider) {
      return Slider(
          label: ((initialvalue as double) * 100).toString(),
          divisions: 5,
          value: initialvalue as double,
          onChanged: (value) {
            print(value);
          });
    }
    return Switch(
        value: true,
        onChanged: (value) {
          print(value);
        });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            this.label,
            style: textTheme.headlineSmall,
            textAlign: TextAlign.start,
          ),
        ),
        _renderControl()
      ],
    );
  }
}
