import 'package:flutter/material.dart';

import '../../../../models/splash_screen_status.dart';
import 'dot/dot.dart';

class DotPainter extends CustomPainter {
  DotPainter.from(
    final SplashScreenStatus status, {
    required final Color logoColor,
    required final Color loadColor,
    required final Color errorColor,
    required final Size logoSize,
    required final AnimationController dotAnimationController,
  }) : dot = Dot.from(
          status,
          logoColor: logoColor,
          loadColor: loadColor,
          errorColor: errorColor,
          logoSize: logoSize,
          dotAnimationController: dotAnimationController,
        );

  final Dot dot;

  @override
  void paint(final Canvas canvas, final Size size) {
    dot.animate;
    canvas.drawCircle(
      dot.getOffset(boxSize: size),
      dot.getRadius(size),
      Paint()..color = dot.dotColor,
    );
  }

  @override
  bool shouldRepaint(covariant final CustomPainter oldDelegate) => true;
}
