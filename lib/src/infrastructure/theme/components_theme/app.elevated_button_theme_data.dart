import 'package:flutter/material.dart';

class AppElevatedButtonThemeData extends ElevatedButtonThemeData {
  AppElevatedButtonThemeData.from(
    final ColorScheme colorScheme,
  ) : super(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              CircleBorder(
                side: BorderSide(
                  style: BorderStyle.solid,
                  width: 3,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
        );
}
