import 'package:flutter/material.dart';

abstract class ThemeRepository {
  Future<void> updateTheme(Color primary, Color secondary);
  Future<ThemeData> getTheme();
}
