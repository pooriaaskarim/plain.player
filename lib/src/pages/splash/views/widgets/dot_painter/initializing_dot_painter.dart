import 'package:flutter/material.dart';

import 'dot_painter.dart';

class InitializingDotPainter extends DotPainter {
  InitializingDotPainter({
    required super.dotAnimationController,
    required super.logoSize,
    required super.themeData,
  });
  @override
  void paint(final Canvas canvas, final Size size) {
    super.paint(canvas, size);
    dotAnimationController.forward();
  }

  @override
  Offset getDotOffset({required final Size boxSize}) =>
      Offset(boxSize.width / 2, boxSize.height / 2);

  @override
  Color get dotColor => themeData.colorScheme.primary.withOpacity(0.4);

  @override
  Tween<double> get loadingEndBetween => Tween<double>(begin: 0.0, end: 0.1);
}
