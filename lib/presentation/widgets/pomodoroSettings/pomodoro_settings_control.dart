import 'package:flutter/material.dart';

enum ControlType { slider, toogle }

class PomodoroSettingsControl<T> extends StatelessWidget {
  final ValueChanged<T> onChanged;
  final T? initialvalue;
  final String label;
  final int? minValue;
  final int? maxValue;
  final ControlType controlType;

  const PomodoroSettingsControl(
      {super.key,
      required this.onChanged,
      this.initialvalue,
      required this.label,
      required this.controlType,
      this.minValue,
      this.maxValue
      
      });

  Widget _renderControl() {
    if (controlType == ControlType.slider) {
      return Slider(
          label: "${((initialvalue as double) * 100).toInt().toString()} min",
          divisions: 6,
          min: ( minValue! / 100),
          max: (maxValue! / 100 ),
          value: initialvalue as double,
          onChanged: (value)  {
            onChanged(value * 100 as T );
            // onChanged(value as T);
          });
    }
    return Switch(
        value: initialvalue as bool,
        onChanged: (value) => onChanged(value as T)
        );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return controlType == ControlType.slider? Column(
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
    )
    : Row(
     crossAxisAlignment: CrossAxisAlignment.center,
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
