import 'package:flutter/material.dart';

import '../utils/color_utils.dart';
import '../utils/font_utils.dart';

class AppThemeData {
  static const String fontFamily = FontUtils.fontFamily;
  static const TextTheme textTheme = FontUtils.textTheme;
  static const ColorScheme lightColorScheme = ColorUtils.lightColorScheme;
  static const ColorScheme darkColorScheme = ColorUtils.darkColorScheme;
  static AppBarTheme appBarTheme(ColorScheme colorScheme) => AppBarTheme(
        actionsIconTheme: IconThemeData(color: colorScheme.onPrimary),
        centerTitle: true,
        color: colorScheme.surfaceTint.withOpacity(0.5),
        foregroundColor: colorScheme.onPrimary,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
        titleTextStyle: FontUtils.textTheme.titleSmall,
      );
}
