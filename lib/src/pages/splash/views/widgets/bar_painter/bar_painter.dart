import 'package:flutter/material.dart';

import '../../../models/splash_screen_status.dart';
import 'bar/bar.dart';

class BarPainter extends CustomPainter {
  BarPainter.from(
    final SplashScreenStatus status, {
    required final AnimationController barAnimationController,
    required final Size logoSize,
    required final Color color,
    required final Color errorColor,
  }) : bar = Bar.from(
          status,
          barAnimationController: barAnimationController,
          logoSize: logoSize,
          color: color,
          errorColor: errorColor,
        );

  final Bar bar;

  /// void paint() from CustomPainter class
  @override
  void paint(final Canvas canvas, final Size size) {
    canvas
      ..drawLine(
        bar.leftStart(size),
        bar.leftEnd(size),
        bar.leftPainter(size),
      )
      ..drawLine(
        bar.rightStart(size),
        bar.rightEnd(size),
        bar.rightPainter(size),
      );
  }

  @override
  bool shouldRepaint(covariant final CustomPainter oldDelegate) => true;
}
