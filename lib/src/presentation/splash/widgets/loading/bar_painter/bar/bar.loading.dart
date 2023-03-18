import 'package:flutter/material.dart';

import 'bar.dart';

class LoadingBar extends Bar {
  const LoadingBar({
    required super.logoColor,
    required super.loadColor,
    required super.errorColor,
    required super.logoSize,
    required super.barAnimationController,
  });

  @override
  Tween<double> get loadingEndBetween => Tween<double>(begin: 0.1, end: 0.5);
}
