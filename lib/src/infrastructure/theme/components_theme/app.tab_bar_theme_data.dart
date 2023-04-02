import 'package:flutter/material.dart';

import '../../utils/app.utils.dart';
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
              topLeft: Radius.circular(AppUtils.size_4Pt),
              topRight: Radius.circular(AppUtils.size_4Pt),
              bottomLeft: Radius.circular(AppUtils.size_0Pt),
              bottomRight: Radius.circular(AppUtils.size_0Pt),
            ),
            borderSide: BorderSide(
              width: AppUtils.size_4Pt,
              color: colorScheme.primary,
            ),
          ),
          labelStyle: AppFonts.textTheme.titleSmall,
          labelColor: colorScheme.primary,
          unselectedLabelColor: colorScheme.onSurfaceVariant,
        );
}
