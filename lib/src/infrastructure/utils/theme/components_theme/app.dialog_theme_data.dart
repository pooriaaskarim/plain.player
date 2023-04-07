import 'package:flutter/material.dart';

import '../../app.elevations.dart';
import '../app.fonts.dart';

class AppDialogThemeData extends DialogTheme {
  AppDialogThemeData(final ColorScheme colorScheme)
      : super(
          titleTextStyle: AppFonts.textTheme.headlineSmall?.merge(
            TextStyle(
              color: colorScheme.onSurface,
            ),
          ),
          contentTextStyle: AppFonts.textTheme.bodyMedium?.merge(
            TextStyle(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          alignment: AlignmentDirectional.centerStart,
          backgroundColor: colorScheme.surface,
          elevation: AppElevations.level_3,
          iconColor: colorScheme.secondary,
        );
}
