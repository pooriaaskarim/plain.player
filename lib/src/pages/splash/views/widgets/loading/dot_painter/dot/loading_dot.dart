import 'package:flutter/material.dart';

import 'dot.dart';

class LoadingDot extends Dot {
  LoadingDot({
    required super.logoColor,
    required super.loadColor,
    required super.errorColor,
    required super.logoSize,
    required super.dotAnimationController,
  });

  @override
  Color get dotColor {
    final Animation<double> animation = CurvedAnimation(
      parent: dotAnimationController,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    );

    final Color middleColor = loadColor.withOpacity(0.5);
    final ColorTween forwardTween = ColorTween(
      begin: super.dotColor,
      end: middleColor,
    );
    final ColorTween reverseTween = ColorTween(
      begin: middleColor,
      end: super.dotColor,
    );

    return ColorTween(
      begin: forwardTween.evaluate(
        animation,
      ),
      end: reverseTween.evaluate(
        animation,
      ),
    ).evaluate(
      animation,
    )!;
  }

  @override
  double getRadius(final Size boxSize) {
    final Animation<double> animation = CurvedAnimation(
      parent: dotAnimationController,
      curve: Curves.easeIn,
    );

    final double middleRadius = 1.2 * super.getRadius(boxSize);

    final forwardTween = Tween<double>(
      begin: super.getRadius(boxSize),
      end: middleRadius,
    );
    final reverseTween = Tween<double>(
      begin: middleRadius,
      end: super.getRadius(boxSize),
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
  Future<void> get animate => dotAnimationController.repeat();
}
