import 'package:flutter/material.dart';

import 'dot.dart';

class SuccessDot extends Dot {
  const SuccessDot({
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
    );
    return ColorTween(begin: super.dotColor, end: loadColor.withOpacity(0.7))
        .evaluate(animation)!;
  }

  @override
  double getRadius(final Size boxSize) {
    final Animation<double> animation = CurvedAnimation(
      parent: dotAnimationController,
      curve: Curves.bounceIn,
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
  Future<void> get animate => dotAnimationController.forward();
}
