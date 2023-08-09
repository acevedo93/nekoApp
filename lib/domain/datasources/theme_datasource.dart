
import 'dart:ui';
import 'package:flutter/material.dart';

abstract class ThemeDatasource {
    Future<void> updateTheme(Color primary, Color secondary);
    Future<ThemeData> getTheme();
}