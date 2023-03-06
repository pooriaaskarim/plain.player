import 'package:flutter/material.dart';

import 'bar_painter.dart';

class InitializingBarPainter extends BarPainter {
  InitializingBarPainter({
    required super.loadingBarAnimationController,
    required super.logoSize,
    required super.themeData,
  });

  @override
  Tween<double> get loadingEndBetween => Tween<double>(begin: 0.0, end: 0.1);
}
