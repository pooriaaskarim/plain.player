import 'package:flutter/material.dart';

import '../../app.elevations.dart';
import '../../app.sizes.dart';
import '../app.fonts.dart';
import '../app.opacities.dart';

class AppFloatingActionButtonThemeData extends FloatingActionButtonThemeData {
  AppFloatingActionButtonThemeData.from(
    final ColorScheme colorScheme,
  ) : super(
          backgroundColor: colorScheme.primaryContainer,
          foregroundColor: colorScheme.onPrimaryContainer,
          focusColor: colorScheme.onPrimaryContainer
              .withOpacity(AppOpacities.focusStateLayerOpacity),
          hoverColor: colorScheme.onPrimaryContainer
              .withOpacity(AppOpacities.hoverStateLayerOpacity),
          splashColor: colorScheme.onPrimaryContainer
              .withOpacity(AppOpacities.pressStateLayerOpacity),
          elevation: AppElevations.elevationLevel_3,
          hoverElevation: AppElevations.elevationLevel_4,
          focusElevation: AppElevations.elevationLevel_3,
          disabledElevation: AppElevations.elevationLevel_1,
          highlightElevation: AppElevations.elevationLevel_3,
          iconSize: AppSizes.size_32Pt,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.size_56Pt),
            side: BorderSide(
              style: BorderStyle.solid,
              width: 1,
              color: colorScheme.onPrimaryContainer.withOpacity(0.3),
            ),
          ),
          enableFeedback: true,
          extendedTextStyle: AppFonts.textTheme.labelLarge
              ?.merge(TextStyle(color: colorScheme.onPrimaryContainer)),
          extendedPadding: const EdgeInsets.all(AppSizes.size_16Pt),
          sizeConstraints: const BoxConstraints(
            maxWidth: AppSizes.size_56Pt,
            maxHeight: AppSizes.size_56Pt,
            minHeight: AppSizes.size_56Pt,
            minWidth: AppSizes.size_56Pt,
          ),
          extendedSizeConstraints: const BoxConstraints(
            maxHeight: AppSizes.size_56Pt,
            minHeight: AppSizes.size_56Pt,
            minWidth: AppSizes.size_56Pt,
          ),
          largeSizeConstraints: const BoxConstraints(
            maxWidth: AppSizes.size_56Pt,
            maxHeight: AppSizes.size_56Pt,
            minHeight: AppSizes.size_56Pt,
            minWidth: AppSizes.size_56Pt,
          ),
          smallSizeConstraints: const BoxConstraints(
            maxWidth: AppSizes.size_40Pt,
            maxHeight: AppSizes.size_40Pt,
            minHeight: AppSizes.size_40Pt,
            minWidth: AppSizes.size_40Pt,
          ),
        );
}
