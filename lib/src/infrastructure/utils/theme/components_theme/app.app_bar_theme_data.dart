import 'package:flutter/material.dart';

import '../../app.elevations.dart';
import '../../app.sizes.dart';
import '../app.fonts.dart';

class AppAppbarThemeData extends AppBarTheme {
  AppAppbarThemeData.from(final ColorScheme colorScheme)
      : super(
          actionsIconTheme: IconThemeData(color: colorScheme.onSurfaceVariant),
          centerTitle: true,
          color: colorScheme.surface.withOpacity(0.7),
          elevation: AppElevations.elevationLevel_0,
          scrolledUnderElevation: AppElevations.elevationLevel_2,
          foregroundColor: colorScheme.onSurface,
          iconTheme: IconThemeData(
            color: colorScheme.onSurfaceVariant,
            size: AppSizes.size_24Pt,
          ),
          surfaceTintColor: colorScheme.surfaceTint,
          toolbarHeight: AppSizes.size_64Pt,
          titleTextStyle: AppFonts.textTheme.titleLarge?.merge(
            TextStyle(
              color: colorScheme.onSurface,
            ),
          ),
        );
}
