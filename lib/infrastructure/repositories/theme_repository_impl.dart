
import 'dart:ui';

import 'package:flutter/src/material/theme_data.dart';
import 'package:nekonapp/domain/datasources/theme_datasource.dart';
import 'package:nekonapp/domain/repositories/theme_repository.dart';
import 'package:nekonapp/infrastructure/datasources/local/local_theme_datasource.dart';

class ThemeRepositoryImpl extends ThemeRepository{


  final ThemeDatasource dataSource;

  ThemeRepositoryImpl({required this.dataSource});


  @override
  Future<ThemeData> getTheme() {
    // TODO: implement getTheme
    return dataSource.getTheme();
  }

  @override
  Future<void> updateTheme(Color primary, Color secondary) {
    return dataSource.updateTheme(primary, secondary);
  }

}