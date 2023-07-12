import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ButtonLink extends StatelessWidget {
  final Function onPress;
  final String label;
  final Color? color;
  const ButtonLink({
    super.key,
    required this.onPress,
    required this.label,
    this.color = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: label,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                onPress();
              }));
  }
}
