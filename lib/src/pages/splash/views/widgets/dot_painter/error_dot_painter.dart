import 'package:flutter/material.dart';

import 'dot_painter.dart';

class ErrorDotPainter extends DotPainter {
  ErrorDotPainter({
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
  Color get dotColor => ColorTween(
        begin: themeData.colorScheme.primary.withOpacity(0.4),
        end: themeData.colorScheme.error.withOpacity(0.4),
      ).evaluate(
        CurvedAnimation(
          parent: dotAnimationController,
          curve: Curves.easeInOut,
        ),
      )!;

  @override
  Tween<double> get loadingEndBetween => Tween<double>(begin: 0.5, end: 1.0);
}
