import 'package:flutter/material.dart';

enum InputModes { password, email, normal, phoneNumber }

class CustomInput extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorText;
  final InputModes mode;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const CustomInput(
      {super.key,
      this.label,
      this.hint,
      this.errorText,
      this.onChanged,
      this.validator,
      this.obscureText = false,
      this.mode = InputModes.normal,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final InputDecoration customInputDecoration = InputDecoration(
        fillColor: theme.primaryColor,
        label: label != null ? Text(label!) : null,
        suffixIcon: const Icon(Icons.check_box_rounded));

    if (mode == InputModes.password) {
      return _TextFormFieldPassword(
        onChanged: onChanged,
        inputDecoration: customInputDecoration,
        controller: controller,
        validator: validator,
      );
    }

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      decoration: customInputDecoration,
      controller: controller,
    );
  }
}

// PASSWORD

class _TextFormFieldPassword extends StatefulWidget {
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final InputDecoration inputDecoration;
  final TextEditingController controller;

  const _TextFormFieldPassword(
      {super.key,
      this.onChanged,
      this.validator,
      required this.inputDecoration,
      required this.controller});

  @override
  State<_TextFormFieldPassword> createState() => _TextFormFieldPasswordState();
}

class _TextFormFieldPasswordState extends State<_TextFormFieldPassword> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    InputDecoration inputPasswordDecoration = widget.inputDecoration.copyWith(
        suffixIcon: IconButton(
      onPressed: () {
        setState(() {
          _isObscure = !_isObscure;
        });
      },
      icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
    ));

    return TextFormField(
      onChanged: widget.onChanged,
      obscureText: _isObscure,
      validator: widget.validator,
      decoration: inputPasswordDecoration,
      controller: widget.controller,
    );
  }
}
