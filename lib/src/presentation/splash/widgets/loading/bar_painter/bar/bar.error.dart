import 'package:flutter/material.dart';

import 'bar.dart';

class ErrorBar extends Bar {
  const ErrorBar({
    required super.logoColor,
    required super.loadColor,
    required super.errorColor,
    required super.logoSize,
    required super.barAnimationController,
  });

  @override
  List<Color> get gradientColors => [logoColor, errorColor.withOpacity(0.5)];

  @override
  Tween<double> get loadingEndBetween => Tween<double>(begin: 0.5, end: 1.0);
}
