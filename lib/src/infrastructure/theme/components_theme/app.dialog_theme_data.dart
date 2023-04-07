import 'package:flutter/material.dart';

import '../../utils/app.utils.dart';
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
          elevation: AppUtils.elevationLevel_3,
          iconColor: colorScheme.secondary,
        );
}
