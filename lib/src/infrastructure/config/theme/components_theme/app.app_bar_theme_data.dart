import 'package:flutter/material.dart';

import '../../../utils/app.sizes.dart';
import '../app.elevations.dart';
import '../app.fonts.dart';

class AppAppbarThemeData extends AppBarTheme {
  AppAppbarThemeData.from(final ColorScheme colorScheme)
      : super(
          actionsIconTheme: IconThemeData(color: colorScheme.onSurfaceVariant),
          centerTitle: true,
          color: colorScheme.surface.withOpacity(0.7),
          elevation: AppElevations.level_0,
          scrolledUnderElevation: AppElevations.level_2,
          foregroundColor: colorScheme.onSurface,
          iconTheme: IconThemeData(
            color: colorScheme.onSurfaceVariant,
            size: AppSizes.points_24,
          ),
          surfaceTintColor: colorScheme.surfaceTint,
          toolbarHeight: AppSizes.points_64,
          titleTextStyle: AppFonts.textTheme.titleLarge?.merge(
            TextStyle(
              color: colorScheme.onSurface,
            ),
          ),
        );
}
