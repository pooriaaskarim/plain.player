import 'package:flutter/material.dart';

import 'app_theme_data.dart';

class AppTheme {
  ///Pood's Light Theme
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppThemeData.appBarTheme(AppThemeData.lightColorScheme),
    brightness: Brightness.light,
    colorScheme: AppThemeData.lightColorScheme,
    primaryColorDark: AppThemeData.darkColorScheme.primary,
    primaryColorLight: AppThemeData.lightColorScheme.primary,
    textTheme: AppThemeData.textTheme,
    useMaterial3: true,
  );

  ///Pood's Dark Theme
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppThemeData.appBarTheme(AppThemeData.darkColorScheme),
    brightness: Brightness.dark,
    colorScheme: AppThemeData.darkColorScheme,
    primaryColor: AppThemeData.darkColorScheme.primary,
    primaryColorDark: AppThemeData.darkColorScheme.primary,
    primaryColorLight: AppThemeData.lightColorScheme.primary,
    textTheme: AppThemeData.textTheme,
    useMaterial3: true,
  );
}
