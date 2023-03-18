import 'package:flutter/material.dart';

import 'bar.dart';

class SuccessBar extends Bar {
  const SuccessBar({
    required super.logoColor,
    required super.loadColor,
    required super.errorColor,
    required super.logoSize,
    required super.barAnimationController,
  });

  @override
  List<Color> get gradientColors => [logoColor, loadColor.withOpacity(0.7)];

  @override
  Tween<double> get loadingEndBetween => Tween<double>(begin: 0.5, end: 1);
}
