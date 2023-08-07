import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final double size;
  final Color color;
  const Loader({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: color
      ),
    );
  }
}