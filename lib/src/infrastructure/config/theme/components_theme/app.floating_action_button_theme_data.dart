import 'package:flutter/material.dart';

import '../../../utils/app.sizes.dart';
import '../app.elevations.dart';
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
          elevation: AppElevations.level_3,
          hoverElevation: AppElevations.level_4,
          focusElevation: AppElevations.level_3,
          disabledElevation: AppElevations.level_1,
          highlightElevation: AppElevations.level_3,
          iconSize: AppSizes.points_32,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.points_56),
            side: BorderSide(
              style: BorderStyle.solid,
              width: 1,
              color: colorScheme.onPrimaryContainer.withOpacity(0.3),
            ),
          ),
          enableFeedback: true,
          extendedTextStyle: AppFonts.textTheme.labelLarge
              ?.merge(TextStyle(color: colorScheme.onPrimaryContainer)),
          extendedPadding: const EdgeInsets.all(AppSizes.points_16),
          sizeConstraints: const BoxConstraints(
            maxWidth: AppSizes.points_56,
            maxHeight: AppSizes.points_56,
            minHeight: AppSizes.points_56,
            minWidth: AppSizes.points_56,
          ),
          extendedSizeConstraints: const BoxConstraints(
            maxHeight: AppSizes.points_56,
            minHeight: AppSizes.points_56,
            minWidth: AppSizes.points_56,
          ),
          largeSizeConstraints: const BoxConstraints(
            maxWidth: AppSizes.points_56,
            maxHeight: AppSizes.points_56,
            minHeight: AppSizes.points_56,
            minWidth: AppSizes.points_56,
          ),
          smallSizeConstraints: const BoxConstraints(
            maxWidth: AppSizes.points_40,
            maxHeight: AppSizes.points_40,
            minHeight: AppSizes.points_40,
            minWidth: AppSizes.points_40,
          ),
        );
}
