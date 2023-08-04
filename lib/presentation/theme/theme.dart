import 'package:flutter/material.dart';

const Color secondary = Color(0xFF8a2be2);
const Color primary = Color(0xFFfaf931);
class CustomTheme{
  static getTheme () {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primary, 
      secondaryHeaderColor: secondary,
      
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: secondary, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(color: secondary)
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: secondary
        )
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: secondary,
        )
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: secondary
        ),
        floatingLabelStyle: TextStyle(
          color: secondary
        ),
        focusedBorder:UnderlineInputBorder(
          borderSide: BorderSide(color: secondary, width: 1)) , 
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          
          foregroundColor: secondary,
          padding: const EdgeInsets.symmetric(horizontal: 70),
          side:const  BorderSide( width: 1, color: secondary),
          textStyle: const TextStyle(
            color: secondary,
            fontWeight: FontWeight.bold
          ), 
        )
      ),
     
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