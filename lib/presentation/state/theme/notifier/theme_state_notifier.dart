



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nekonapp/domain/repositories/theme_repository.dart';
import 'package:nekonapp/infrastructure/datasources/local/local_theme_datasource.dart';
import 'package:nekonapp/infrastructure/repositories/theme_repository_impl.dart';
import 'package:nekonapp/presentation/state/theme/theme_state.dart';

import '../../../../infrastructure/datasources/firebase/firebase_pomodoro_datasource_impl.dart';

class ThemeStateNotifier extends StateNotifier<ThemeState>{

    final _themeRepository = ThemeRepositoryImpl(dataSource: LocalThemeDatasourceImpl());

  final Color _colorPrimaryDefault = const Color(0XFF008080);
  final Color _colorSecondaryDefault =const Color(0XFFf3fcfa);

  ThemeStateNotifier(): super(const ThemeState(
    primary: Color(0XFF008080),
    secondary: Color(0XFFf3fcfa),
  )) {
    setThemeData();
  }


  void setThemeData() {

    state = state.copyWith(theme:ThemeData(
      useMaterial3: true,
      primaryColor: state.primary,
      secondaryHeaderColor: state.secondary,
      sliderTheme: SliderThemeData(
        secondaryActiveTrackColor: state.secondary,
        activeTickMarkColor: state.secondary,
        overlayColor: state.secondary,
        thumbColor: state.secondary,
        activeTrackColor: state.secondary,
        valueIndicatorColor: state.secondary,
        valueIndicatorTextStyle: TextStyle(color: state.primary),
      ),
      switchTheme: SwitchThemeData(
          thumbColor: MaterialStateColor.resolveWith((states) => state.secondary!),
          overlayColor: MaterialStateColor.resolveWith((states) => state.primary!),
          trackColor: MaterialStateColor.resolveWith((states) => state.primary!),
          trackOutlineColor:
              MaterialStateColor.resolveWith((states) => state.secondary!)),
      textTheme: TextTheme(
          headlineLarge:
              TextStyle(color: state.secondary, fontWeight: FontWeight.bold),
          headlineSmall:
              TextStyle(color: state.secondary, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: state.secondary)),
      scaffoldBackgroundColor: state.primary,
      appBarTheme: AppBarTheme(
          backgroundColor: state.primary,
          iconTheme: IconThemeData(color: state.secondary),
          titleTextStyle:
              TextStyle(color: state.secondary, fontWeight: FontWeight.bold)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: state.secondary)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        foregroundColor: state.secondary,
      )),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: state.secondary!, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: state.secondary!, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        contentPadding: const EdgeInsets.all(10),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        foregroundColor: state.secondary,
        padding: const EdgeInsets.symmetric(horizontal: 70),
        side: BorderSide(width: 1, color: state.secondary!),
        textStyle:
            TextStyle(color: state.secondary, fontWeight: FontWeight.bold),
      )),
    ));

  }

  void setColors(Color primary, Color secondary) {
    state = state.copyWith(primary: primary, secondary: secondary);
    setThemeData();
    _themeRepository.updateTheme(primary, secondary);
  }

  void flipColors(){
    state = state.copyWith(primary: state.secondary, secondary: state.primary);
    _themeRepository.updateTheme(state.secondary!, state.primary!);
  }
}


  

