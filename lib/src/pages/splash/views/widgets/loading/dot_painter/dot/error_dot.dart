import 'package:flutter/material.dart';

import 'dot.dart';

class ErrorDot extends Dot {
  const ErrorDot({
    required super.logoColor,
    required super.loadColor,
    required super.errorColor,
    required super.logoSize,
    required super.dotAnimationController,
  });

  @override
  double getRadius(final Size boxSize) {
    final Animation<double> animation = CurvedAnimation(
      parent: dotAnimationController,
      curve: Curves.bounceOut,
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
  Color get dotColor => ColorTween(
        begin: super.dotColor,
        end: errorColor.withOpacity(0.3),
      ).evaluate(
        CurvedAnimation(
          parent: dotAnimationController,
          curve: Curves.easeInOut,
        ),
      )!;

  @override
  Future<void> get animate => dotAnimationController.forward();
}
