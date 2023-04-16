import 'package:flutter/material.dart';

import '../app.elevations.dart';

class AppSnackBarThemeData extends SnackBarThemeData {
  const AppSnackBarThemeData()
      : super(
          behavior: SnackBarBehavior.floating,
          elevation: AppElevations.level_3,
        );
}
