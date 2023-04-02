import 'package:flutter/material.dart';

import '../../utils/app.utils.dart';
import '../app.fonts.dart';

class AppAppbarThemeData extends AppBarTheme {
  AppAppbarThemeData.from(final ColorScheme colorScheme)
      : super(
          actionsIconTheme: IconThemeData(color: colorScheme.onSurfaceVariant),
          centerTitle: true,
          color: colorScheme.surface.withOpacity(0.7),
          elevation: 1,
          foregroundColor: colorScheme.onSurface,
          iconTheme: IconThemeData(
              color: colorScheme.onSurfaceVariant, size: AppUtils.size_24Pt),
          scrolledUnderElevation: 2,
          surfaceTintColor: colorScheme.surfaceTint,
          toolbarHeight: AppUtils.size_64Pt,
          titleTextStyle: AppFonts.textTheme.titleLarge?.merge(
            TextStyle(
              color: colorScheme.onSurface,
            ),
          ),
        );
}
