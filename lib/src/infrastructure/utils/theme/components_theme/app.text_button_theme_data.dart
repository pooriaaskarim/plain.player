import 'package:flutter/material.dart';

import '../../app.elevations.dart';
import '../app.fonts.dart';
import '../app.opacities.dart';

class AppTextButtonThemeData extends TextButtonThemeData {
  AppTextButtonThemeData(final ColorScheme colorScheme)
      : super(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (final states) {
                if (states.any(
                  {
                    MaterialState.disabled,
                  }.contains,
                )) {
                  return colorScheme.primary
                      .withOpacity(AppOpacities.disabledStateLayerOpacity);
                }
                if (states.any(
                  {
                    MaterialState.hovered,
                  }.contains,
                )) {
                  return colorScheme.primary
                      .withOpacity(AppOpacities.hoverStateLayerOpacity);
                }
                if (states.any(
                  {
                    MaterialState.focused,
                  }.contains,
                )) {
                  return colorScheme.primary
                      .withOpacity(AppOpacities.focusStateLayerOpacity);
                }
                if (states.any(
                  {
                    MaterialState.pressed,
                  }.contains,
                )) {
                  return colorScheme.primary
                      .withOpacity(AppOpacities.pressStateLayerOpacity);
                }
                //default: enabled state
                return null;
              },
            ),
            elevation: MaterialStateProperty.resolveWith<double?>(
              (final states) {
                if (states.any(
                  {
                    MaterialState.disabled,
                  }.contains,
                )) {
                  return AppElevations.level_0;
                }
                if (states.any(
                  {
                    MaterialState.hovered,
                  }.contains,
                )) {
                  return AppElevations.level_2;
                }
                //focused, pressed and enabled states
                return AppElevations.level_1;
              },
            ),
            textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
              (final states) {
                final TextStyle? textStyle = AppFonts.textTheme.labelLarge;
                if (states.any(
                  {
                    MaterialState.disabled,
                  }.contains,
                )) {
                  return textStyle?.merge(
                    TextStyle(
                      color: colorScheme.onSurface.withOpacity(38 / 100),
                    ),
                  );
                }
                //Any State other than disabled
                return textStyle?.merge(
                  TextStyle(
                    color: colorScheme.primary,
                  ),
                );
              },
            ),
            iconColor: MaterialStateProperty.resolveWith<Color?>(
              (final states) {
                if (states.any(
                  {
                    MaterialState.disabled,
                  }.contains,
                )) {
                  return colorScheme.onSurface.withOpacity(38 / 100);
                }
                //Any State other than disabled
                return colorScheme.primary;
              },
            ),
          ),
        );
}
