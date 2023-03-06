import 'package:flutter/material.dart';

import 'bar_painter.dart';

class ErrorBarPainter extends BarPainter {
  ErrorBarPainter({
    required super.loadingBarAnimationController,
    required super.logoSize,
    required super.themeData,
  });
  @override
  Tween<double> get loadingEndBetween => Tween<double>(begin: 0.5, end: 1.0);
}
