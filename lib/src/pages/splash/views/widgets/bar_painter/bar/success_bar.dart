import 'package:flutter/material.dart';

import 'bar.dart';

class SuccessBar extends Bar {
  const SuccessBar({
    required super.loadingBarAnimationController,
    required super.logoSize,
    required super.color,
    required super.errorColor,
  });
  @override
  Tween<double> get loadingEndBetween => Tween<double>(begin: 0.5, end: 1);
}
