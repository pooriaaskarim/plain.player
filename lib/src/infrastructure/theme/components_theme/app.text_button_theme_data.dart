import 'package:flutter/material.dart';

import '../../utils/app.utils.dart';
import '../app.fonts.dart';

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
                      .withOpacity(AppUtils.disabledStateLayerOpacity);
                }
                if (states.any(
                  {
                    MaterialState.hovered,
                  }.contains,
                )) {
                  return colorScheme.primary
                      .withOpacity(AppUtils.hoverStateLayerOpacity);
                }
                if (states.any(
                  {
                    MaterialState.focused,
                  }.contains,
                )) {
                  return colorScheme.primary
                      .withOpacity(AppUtils.focusStateLayerOpacity);
                }
                if (states.any(
                  {
                    MaterialState.pressed,
                  }.contains,
                )) {
                  return colorScheme.primary
                      .withOpacity(AppUtils.pressStateLayerOpacity);
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
                  return AppUtils.elevationLevel_0;
                }
                if (states.any(
                  {
                    MaterialState.hovered,
                  }.contains,
                )) {
                  return AppUtils.elevationLevel_2;
                }
                //focused, pressed and enabled states
                return AppUtils.elevationLevel_1;
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
