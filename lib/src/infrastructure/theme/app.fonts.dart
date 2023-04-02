import 'package:flutter/material.dart';

class AppFonts {
  AppFonts._();

  ///Plain Text Theme Data
  static const TextTheme textTheme = TextTheme(
      displayLarge: TextStyle(
        fontFamily: AppFonts.fontFamily,
        fontSize: AppFonts._displayLarge,
        fontStyle: FontStyle.normal,
      ),
      displayMedium: TextStyle(
        fontFamily: AppFonts.fontFamily,
        fontSize: AppFonts._displayMedium,
        fontStyle: FontStyle.normal,
      ),
      displaySmall: TextStyle(
        fontFamily: AppFonts.fontFamily,
        fontSize: AppFonts._displaySmall,
        fontStyle: FontStyle.normal,
      ),
      headlineLarge: TextStyle(
        fontFamily: AppFonts.fontFamily,
        fontSize: AppFonts._headlineLarge,
        fontStyle: FontStyle.normal,
      ),
      headlineMedium: TextStyle(
        fontFamily: AppFonts.fontFamily,
        fontSize: AppFonts._headlineMedium,
        fontStyle: FontStyle.normal,
      ),
      headlineSmall: TextStyle(
        fontFamily: AppFonts.fontFamily,
        fontSize: AppFonts._headlineSmall,
        fontStyle: FontStyle.normal,
      ),
      titleLarge: TextStyle(
        fontFamily: AppFonts.fontFamily,
        fontSize: AppFonts._titleLarge,
        fontStyle: FontStyle.normal,
      ),
      titleMedium: TextStyle(
        fontFamily: AppFonts.fontFamily,
        fontSize: AppFonts._titleMedium,
        fontStyle: FontStyle.normal,
      ),
      titleSmall: TextStyle(
        fontFamily: AppFonts.fontFamily,
        fontSize: AppFonts._titleSmall,
        fontStyle: FontStyle.normal,
      ),
      bodyLarge: TextStyle(
        fontFamily: AppFonts.fontFamily,
        fontSize: AppFonts._bodyLarge,
        fontStyle: FontStyle.normal,
      ),
      bodyMedium: TextStyle(
        fontFamily: AppFonts.fontFamily,
        fontSize: AppFonts._bodyMedium,
        fontStyle: FontStyle.normal,
      ),
      bodySmall: TextStyle(
        fontFamily: AppFonts.fontFamily,
        fontSize: AppFonts._bodySmall,
        fontStyle: FontStyle.normal,
      ),
      l);
//#endregion
  //#region App Font Size
  ///Font Family
  static const String fontFamily = 'Roboto';

  ///Font size for Display Large
  static const double _displayLarge = 36.0;

  ///Font size for Display Medium
  static const double _displayMedium = 45.0;

  ///Font size for Display Small
  static const double _displaySmall = 57.0;

  ///Font size for Headline Large
  static const double _headlineLarge = 32.0;

  ///Font size for Headline Medium
  static const double _headlineMedium = 28.0;

  ///Font size for Headline Small
  static const double _headlineSmall = 24.0;

  ///Font size for Title Large
  static const double _titleLarge = 22.0;

  ///Font size for Title Medium
  static const double _titleMedium = 16.0;

  ///Font size for Title Small
  static const double _titleSmall = 14.0;

  ///Font size for Body Large
  static const double _bodyLarge = 16.0;

  ///Font size for Body Medium
  static const double _bodyMedium = 14.0;

  ///Font size for Body Small
  static const double _bodySmall = 12.0;

  ///Font size for buttonText
  static const double _buttonText = 12.0;
  //#endregion
}
