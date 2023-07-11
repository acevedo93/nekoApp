import 'package:flutter/material.dart';

const Color primary = Color(0xFFD69054);
const Color secondary = Color(0xFFFFCF6F);
class CustomTheme{
  static getTheme () {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primary, 
      secondaryHeaderColor: secondary,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        )
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 70),
          side:const  BorderSide( width: 1, color: Colors.white),
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ), 
        )
      )
    );
  }
}

// MaterialColor createMaterialColor(Color color) {
//   List strengths = <double>[.05];
//   Map<int, Color> swatch = {};
//   final int r = color.red, g = color.green, b = color.blue;

//   for (int i = 1; i < 10; i++) {
//     strengths.add(0.1 * i);
//   }
//   for (var strength in strengths) {
//     final double ds = 0.5 - strength;
//     swatch[(strength * 1000).round()] = Color.fromRGBO(
//       r + ((ds < 0 ? r : (255 - r)) * ds).round(),
//       g + ((ds < 0 ? g : (255 - g)) * ds).round(),
//       b + ((ds < 0 ? b : (255 - b)) * ds).round(),
//       1,
//     );
//   };
//   return MaterialColor(color.value, swatch);
// }