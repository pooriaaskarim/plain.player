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
              topLeft: Radius.circular(AppSizes.size_4Pt),
              topRight: Radius.circular(AppSizes.size_4Pt),
              bottomLeft: Radius.circular(AppSizes.size_0Pt),
              bottomRight: Radius.circular(AppSizes.size_0Pt),
            ),
            borderSide: BorderSide(
              width: AppSizes.size_4Pt,
              color: colorScheme.primary,
            ),
          ),
          labelStyle: AppFonts.textTheme.titleSmall,
          labelColor: colorScheme.primary,
          unselectedLabelColor: colorScheme.onSurfaceVariant,
        );
}
