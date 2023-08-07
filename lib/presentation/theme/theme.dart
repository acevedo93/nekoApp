import 'package:flutter/material.dart';

const Color secondary = Color(0xFF8a2be2);
const Color primary = Color(0xFFfaf931);

// const Color primary = Color(0XFF008080);
// const Color secondary = Color(0XFFf3fcfa);

// const Color primary =Color(0XFF7cb382);
// const Color secondary =Color(0XFF411732);

class CustomTheme {
  static getTheme() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primary,
      secondaryHeaderColor: secondary,
      sliderTheme: SliderThemeData(
        secondaryActiveTrackColor: secondary,
        activeTickMarkColor: secondary,
        overlayColor: secondary,
        thumbColor: secondary,
        activeTrackColor: secondary,
        valueIndicatorColor: secondary,
        valueIndicatorTextStyle: TextStyle(color: primary),
      ),
      switchTheme: SwitchThemeData(
          thumbColor: MaterialStateColor.resolveWith((states) => secondary),
          overlayColor: MaterialStateColor.resolveWith((states) => primary),
          trackColor: MaterialStateColor.resolveWith((states) => primary),
          trackOutlineColor:
              MaterialStateColor.resolveWith((states) => secondary)),
      textTheme: const TextTheme(
          headlineLarge:
              TextStyle(color: secondary, fontWeight: FontWeight.bold),
          headlineSmall:
              TextStyle(color: secondary, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: secondary)),
      scaffoldBackgroundColor: primary,
      appBarTheme: AppBarTheme(
          backgroundColor: primary,
          iconTheme: IconThemeData(color: secondary),
          titleTextStyle:
              TextStyle(color: secondary, fontWeight: FontWeight.bold)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: secondary)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        foregroundColor: secondary,
      )),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secondary, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secondary, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        contentPadding: const EdgeInsets.all(10),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        foregroundColor: secondary,
        padding: const EdgeInsets.symmetric(horizontal: 70),
        side: const BorderSide(width: 1, color: secondary),
        textStyle:
            const TextStyle(color: secondary, fontWeight: FontWeight.bold),
      )),
    );
  }
}
