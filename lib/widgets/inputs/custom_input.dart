import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorText;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  const CustomInput(
      {super.key,
      this.label,
      this.hint,
      this.errorText,
      this.onChanged,
      this.validator,
      this.obscureText = false

      });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);




    final InputDecoration customInputDecoration = InputDecoration(
      fillColor: theme.primaryColor,
      label: label != null? Text(label!) : null,
      suffixIcon: Icon(Icons.check_box_rounded)
    );
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: customInputDecoration
    );
  }
}
