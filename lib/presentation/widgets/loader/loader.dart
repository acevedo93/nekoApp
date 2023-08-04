import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final double size;
  const Loader({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: primaryColor
      ),
    );
  }
}