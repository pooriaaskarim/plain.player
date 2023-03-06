import 'package:flutter/material.dart';

import 'bar.dart';

class InitializingBar extends Bar {
  const InitializingBar({
    required super.loadingBarAnimationController,
    required super.logoSize,
    required super.color,
    required super.errorColor,
  });
  @override
  Tween<double> get loadingEndBetween => Tween<double>(begin: 0.0, end: 0.1);
}
