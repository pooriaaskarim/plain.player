import 'package:flutter/material.dart';

import 'bar.dart';

class ErrorBar extends Bar {
  const ErrorBar({
    required super.loadingBarAnimationController,
    required super.logoSize,
    required super.color,
    required super.errorColor,
  });
  @override
  Tween<double> get loadingEndBetween => Tween<double>(begin: 0.5, end: 1.0);
  @override
  Paint leftPainter(final Size boxSize) => super.leftPainter(boxSize)
    ..shader = LinearGradient(
      colors: [color, errorColor],
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    ).createShader(
      Rect.fromLTRB(
        0,
        10,
        logoDistanceFromScreenEdge(boxSize),
        10,
      ),
    );
  @override
  Paint rightPainter(final Size boxSize) => super.leftPainter(boxSize)
    ..shader = LinearGradient(
      colors: [color, errorColor],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(
      Rect.fromLTRB(
        logoDistanceFromScreenEdge(boxSize) + logoSize.width,
        10,
        boxSize.width,
        10,
      ),
    );
}
