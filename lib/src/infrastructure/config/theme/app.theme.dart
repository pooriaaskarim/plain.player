import 'package:flutter/material.dart';

import 'app.theme_data.dart';
import 'components_theme/app.app_bar_theme_data.dart';
import 'components_theme/app.dialog_theme_data.dart';
import 'components_theme/app.elevated_button_theme_data.dart';
import 'components_theme/app.floating_action_button_theme_data.dart';
import 'components_theme/app.snack_bar_theme_data.dart';
import 'components_theme/app.tab_bar_theme_data.dart';
import 'components_theme/app.text_button_theme_data.dart';

class AppTheme {
  AppTheme._();

  ///Plain's Light Theme
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppAppbarThemeData.from(AppThemeData.lightColorScheme),
    brightness: Brightness.light,
    colorScheme: AppThemeData.lightColorScheme,
    dialogTheme: AppDialogThemeData(AppThemeData.lightColorScheme),
    elevatedButtonTheme: AppElevatedButtonThemeData.from(
      AppThemeData.lightColorScheme,
    ),
    floatingActionButtonTheme: AppFloatingActionButtonThemeData.from(
      AppThemeData.lightColorScheme,
    ),
    primaryColorDark: AppThemeData.darkColorScheme.primary,
    primaryColorLight: AppThemeData.lightColorScheme.primary,
    snackBarTheme: const AppSnackBarThemeData(),
    tabBarTheme: AppTabBarThemeData.from(AppThemeData.lightColorScheme),
    textButtonTheme: AppTextButtonThemeData(AppThemeData.lightColorScheme),
    textTheme: AppThemeData.textTheme,
    useMaterial3: true,
  );

  ///Plain's Dark Theme
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppAppbarThemeData.from(AppThemeData.darkColorScheme),
    brightness: Brightness.dark,
    colorScheme: AppThemeData.darkColorScheme,
    dialogTheme: AppDialogThemeData(AppThemeData.darkColorScheme),
    elevatedButtonTheme: AppElevatedButtonThemeData.from(
      AppThemeData.darkColorScheme,
    ),
    floatingActionButtonTheme: AppFloatingActionButtonThemeData.from(
      AppThemeData.darkColorScheme,
    ),
    primaryColor: AppThemeData.darkColorScheme.primary,
    primaryColorDark: AppThemeData.darkColorScheme.primary,
    primaryColorLight: AppThemeData.lightColorScheme.primary,
    snackBarTheme: const AppSnackBarThemeData(),
    tabBarTheme: AppTabBarThemeData.from(AppThemeData.darkColorScheme),
    textButtonTheme: AppTextButtonThemeData(AppThemeData.darkColorScheme),
    textTheme: AppThemeData.textTheme,
    useMaterial3: true,
  );
}
