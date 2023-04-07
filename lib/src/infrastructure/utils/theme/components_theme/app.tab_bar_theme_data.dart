import 'package:flutter/material.dart';

import '../../app.sizes.dart';
import '../app.fonts.dart';

class AppTabBarThemeData extends TabBarTheme {
  AppTabBarThemeData.from(final ColorScheme colorScheme)
      : super(
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: EdgeInsets.zero,
          indicatorColor: colorScheme.primary,
          indicator: UnderlineTabIndicator(
            insets: EdgeInsets.zero,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSizes.points_4),
              topRight: Radius.circular(AppSizes.points_4),
              bottomLeft: Radius.circular(AppSizes.points_0),
              bottomRight: Radius.circular(AppSizes.points_0),
            ),
            borderSide: BorderSide(
              width: AppSizes.points_4,
              color: colorScheme.primary,
            ),
          ),
          labelStyle: AppFonts.textTheme.titleSmall,
          labelColor: colorScheme.primary,
          unselectedLabelColor: colorScheme.onSurfaceVariant,
        );
}
