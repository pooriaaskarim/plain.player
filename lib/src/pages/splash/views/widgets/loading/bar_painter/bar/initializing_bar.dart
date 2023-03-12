import 'package:flutter/material.dart';

import 'bar.dart';

class InitializingBar extends Bar {
  const InitializingBar({
    required super.logoColor,
    required super.loadColor,
    required super.errorColor,
    required super.logoSize,
    required super.loadingBarAnimationController,
  });

  @override
  Tween<double> get loadingEndBetween => Tween<double>(begin: 0.0, end: 0.1);
}
