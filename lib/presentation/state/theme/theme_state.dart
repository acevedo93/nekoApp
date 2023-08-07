import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  final Color? primary;
  final Color? secondary;
  final ThemeData? theme;

  const ThemeState({this.primary, this.secondary, this.theme});

  ThemeState copyWith(
          {Color? primary,
          Color? secondary,
          ThemeData? theme,
          }
  ) =>
      ThemeState(
          primary: primary ?? this.primary,
          secondary: secondary ?? this.secondary,
          theme: theme ?? this.theme,
      )
        ;
  @override
  List<Object?> get props => [primary, secondary];
}
