import 'package:flutter/material.dart';

import '../../utils/app.utils.dart';
import '../app.fonts.dart';

class AppFloatingActionButtonThemeData extends FloatingActionButtonThemeData {
  AppFloatingActionButtonThemeData.from(
    final ColorScheme colorScheme,
  ) : super(
          backgroundColor: colorScheme.primaryContainer,
          foregroundColor: colorScheme.onPrimaryContainer,
          splashColor: colorScheme.onPrimaryContainer.withOpacity(0.1),
          elevation: 3,
          hoverElevation: 4,
          focusElevation: 3,
          disabledElevation: 1,
          highlightElevation: 4,
          iconSize: AppUtils.size_32Pt,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppUtils.size_56Pt),
            side: BorderSide(
              style: BorderStyle.solid,
              width: 1,
              color: colorScheme.onPrimaryContainer.withOpacity(0.3),
            ),
          ),
          enableFeedback: true,
          extendedTextStyle: AppFonts.textTheme.labelLarge,
          extendedPadding: const EdgeInsets.all(AppUtils.size_16Pt),
          sizeConstraints: const BoxConstraints(
            maxWidth: AppUtils.size_56Pt,
            maxHeight: AppUtils.size_56Pt,
            minHeight: AppUtils.size_40Pt,
            minWidth: AppUtils.size_40Pt,
          ),
          extendedSizeConstraints: const BoxConstraints(
            maxHeight: AppUtils.size_56Pt,
            minHeight: AppUtils.size_56Pt,
            minWidth: AppUtils.size_40Pt,
          ),
          largeSizeConstraints: const BoxConstraints(
            maxWidth: AppUtils.size_56Pt,
            maxHeight: AppUtils.size_56Pt,
            minHeight: AppUtils.size_56Pt,
            minWidth: AppUtils.size_56Pt,
          ),
          smallSizeConstraints: const BoxConstraints(
            maxWidth: AppUtils.size_40Pt,
            maxHeight: AppUtils.size_40Pt,
            minHeight: AppUtils.size_40Pt,
            minWidth: AppUtils.size_40Pt,
          ),
        );
}
