import 'package:flutter/material.dart';

import 'dot_painter.dart';

class LoadingDotPainter extends DotPainter {
  LoadingDotPainter({
    required super.dotAnimationController,
    required super.logoSize,
    required super.themeData,
  });

  @override
  void paint(final Canvas canvas, final Size size) {
    super.paint(canvas, size);
    dotAnimationController.repeat();
  }

  @override
  Offset getDotOffset({required final Size boxSize}) =>
      Offset(boxSize.width / 2, boxSize.height / 2);
  @override
  Color get dotColor {
    const double minOpacity = 0.4;
    const double maxOpacity = 0.6;
    final Animation<double> animation = CurvedAnimation(
      parent: dotAnimationController,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    );

    final Tween<double> forwardTween = Tween<double>(
      begin: minOpacity,
      end: maxOpacity,
    );
    final Tween<double> reverseTween = Tween<double>(
      begin: maxOpacity,
      end: minOpacity,
    );

    return themeData.colorScheme.primary.withOpacity(
      Tween<double>(
        begin: forwardTween.evaluate(
          animation,
        ),
        end: reverseTween.evaluate(
          animation,
        ),
      ).evaluate(
        animation,
      ),
    );
  }

  @override
  double getDotRadius(final Size boxSize) {
    final Animation<double> animation = CurvedAnimation(
      parent: dotAnimationController,
      curve: Curves.easeIn,
    );
    final forwardTween = Tween<double>(
      begin: super.getDotRadius(boxSize),
      end: boxSize.width / 2,
    );
    final reverseTween = Tween<double>(
      begin: boxSize.width / 2,
      end: super.getDotRadius(boxSize),
    );
    return Tween<double>(
      begin: forwardTween.evaluate(
        animation,
      ),
      end: reverseTween.evaluate(
        animation,
      ),
    ).evaluate(
      animation,
    );
  }

  @override
  Tween<double> get loadingEndBetween => Tween<double>(begin: 0.1, end: 0.5);
}
