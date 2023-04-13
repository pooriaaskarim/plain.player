import 'package:flutter/material.dart';

import '../app.fonts.dart';

class AppTabBarThemeData extends TabBarTheme {
  AppTabBarThemeData.from(final ColorScheme colorScheme)
      : super(
          indicatorSize: TabBarIndicatorSize.tab,
          labelPadding: EdgeInsets.zero,
          indicatorColor: colorScheme.primary,
          indicator: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1,
                style: BorderStyle.solid,
                color: colorScheme.primary,
              ),
              right: BorderSide.none,
              left: BorderSide.none,
              bottom: BorderSide.none,
            ),
          ),
          labelStyle: AppFonts.textTheme.titleSmall,
          labelColor: colorScheme.primary,
          unselectedLabelColor: colorScheme.onSurfaceVariant,
        );
}
