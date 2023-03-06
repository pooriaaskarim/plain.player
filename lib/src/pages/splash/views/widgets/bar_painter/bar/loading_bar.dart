import 'package:flutter/material.dart';

import 'bar.dart';

class LoadingBar extends Bar {
  const LoadingBar({
    required super.loadingBarAnimationController,
    required super.logoSize,
    required super.color,
    required super.errorColor,
  });
  @override
  Tween<double> get loadingEndBetween => Tween<double>(begin: 0.1, end: 0.5);
}
