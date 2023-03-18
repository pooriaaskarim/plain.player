import 'package:flutter/material.dart';

import '../../../../../application/splash/state.splash.dart';
import 'bar/bar.dart';

class BarPainter extends CustomPainter {
  BarPainter.from(
    final SplashState state, {
    required final Color logoColor,
    required final Color loadColor,
    required final Color errorColor,
    required final Size logoSize,
    required final AnimationController barAnimationController,
  }) : bar = Bar.from(
          state,
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
    bar.animate;
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
