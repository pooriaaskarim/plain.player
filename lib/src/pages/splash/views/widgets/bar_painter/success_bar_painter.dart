import 'package:flutter/material.dart';

import 'bar_painter.dart';

class SuccessBarPainter extends BarPainter {
  SuccessBarPainter({
    required super.loadingBarAnimationController,
    required super.logoSize,
    required super.themeData,
  });

  @override
  Tween<double> get loadingEndBetween => Tween<double>(begin: 0.5, end: 1);
}
