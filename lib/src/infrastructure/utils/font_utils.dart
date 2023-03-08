import 'package:flutter/material.dart';

class FontUtils {
  ///Plain Text Theme Data
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: FontUtils.fontFamily,
      fontSize: FontUtils.displayLarge,
      fontStyle: FontStyle.normal,
    ),
    displayMedium: TextStyle(
      fontFamily: FontUtils.fontFamily,
      fontSize: FontUtils.displayMedium,
      fontStyle: FontStyle.normal,
    ),
    displaySmall: TextStyle(
      fontFamily: FontUtils.fontFamily,
      fontSize: FontUtils.displaySmall,
      fontStyle: FontStyle.normal,
    ),
    headlineLarge: TextStyle(
      fontFamily: FontUtils.fontFamily,
      fontSize: FontUtils.headlineLarge,
      fontStyle: FontStyle.normal,
    ),
    headlineMedium: TextStyle(
      fontFamily: FontUtils.fontFamily,
      fontSize: FontUtils.headlineMedium,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: TextStyle(
      fontFamily: FontUtils.fontFamily,
      fontSize: FontUtils.headlineSmall,
      fontStyle: FontStyle.normal,
    ),
    titleLarge: TextStyle(
      fontFamily: FontUtils.fontFamily,
      fontSize: FontUtils.displaySmall,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: TextStyle(
      fontFamily: FontUtils.fontFamily,
      fontSize: FontUtils.displaySmall,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: TextStyle(
      fontFamily: FontUtils.fontFamily,
      fontSize: FontUtils.displaySmall,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: TextStyle(
      fontFamily: FontUtils.fontFamily,
      fontSize: FontUtils.bodyLarge,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: TextStyle(
      fontFamily: FontUtils.fontFamily,
      fontSize: FontUtils.bodyMedium,
      fontStyle: FontStyle.normal,
    ),
    bodySmall: TextStyle(
      fontFamily: FontUtils.fontFamily,
      fontSize: FontUtils.bodySmall,
      fontStyle: FontStyle.normal,
    ),
  );
//#endregion
  //#region App Font Size
  ///Font Family
  static const String fontFamily = 'Roboto';

  ///Font size for Display Large
  static const double displayLarge = 36.0;

  ///Font size for Display Medium
  static const double displayMedium = 45.0;

  ///Font size for Display Small
  static const double displaySmall = 57.0;

  ///Font size for Headline Large
  static const double headlineLarge = 32.0;

  ///Font size for Headline Medium
  static const double headlineMedium = 28.0;

  ///Font size for Headline Small
  static const double headlineSmall = 24.0;

  ///Font size for Title Large
  static const double titleLarge = 22.0;

  ///Font size for Title Medium
  static const double titleMedium = 16.0;

  ///Font size for Title Small
  static const double titleSmall = 14.0;

  ///Font size for Body Large
  static const double bodyLarge = 16.0;

  ///Font size for Body Medium
  static const double bodyMedium = 14.0;

  ///Font size for Body Small
  static const double bodySmall = 12.0;

  ///Font size for buttonText
  static const double buttonText = 12.0;
  //#endregion
}
