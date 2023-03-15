import 'package:flutter/material.dart';

import '../../../../../domain/splash/splash_screen_status.enum.dart';
import 'bar/bar.dart';

class BarPainter extends CustomPainter {
  BarPainter.from(
    final SplashScreenStatus status, {
    required final Color logoColor,
    required final Color loadColor,
    required final Color errorColor,
    required final Size logoSize,
    required final AnimationController barAnimationController,
  }) : bar = Bar.from(
          status,
          logoColor: logoColor,
          loadColor: loadColor,
          errorColor: errorColor,
          barAnimationController: barAnimationController,
          logoSize: logoSize,
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
