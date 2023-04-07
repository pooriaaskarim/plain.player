import 'package:flutter/material.dart';

import '../../utils/app.utils.dart';
import '../app.fonts.dart';

class AppFloatingActionButtonThemeData extends FloatingActionButtonThemeData {
  AppFloatingActionButtonThemeData.from(
    final ColorScheme colorScheme,
  ) : super(
          backgroundColor: colorScheme.primaryContainer,
          foregroundColor: colorScheme.onPrimaryContainer,
          focusColor: colorScheme.onPrimaryContainer
              .withOpacity(AppUtils.focusStateLayerOpacity),
          hoverColor: colorScheme.onPrimaryContainer
              .withOpacity(AppUtils.hoverStateLayerOpacity),
          splashColor: colorScheme.onPrimaryContainer
              .withOpacity(AppUtils.pressStateLayerOpacity),
          elevation: AppUtils.elevationLevel_3,
          hoverElevation: AppUtils.elevationLevel_4,
          focusElevation: AppUtils.elevationLevel_3,
          disabledElevation: AppUtils.elevationLevel_1,
          highlightElevation: AppUtils.elevationLevel_3,
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
          extendedTextStyle: AppFonts.textTheme.labelLarge
              ?.merge(TextStyle(color: colorScheme.onPrimaryContainer)),
          extendedPadding: const EdgeInsets.all(AppUtils.size_16Pt),
          sizeConstraints: const BoxConstraints(
            maxWidth: AppUtils.size_56Pt,
            maxHeight: AppUtils.size_56Pt,
            minHeight: AppUtils.size_56Pt,
            minWidth: AppUtils.size_56Pt,
          ),
          extendedSizeConstraints: const BoxConstraints(
            maxHeight: AppUtils.size_56Pt,
            minHeight: AppUtils.size_56Pt,
            minWidth: AppUtils.size_56Pt,
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
