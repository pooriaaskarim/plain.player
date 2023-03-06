import 'package:flutter/material.dart';

import 'dot.dart';

class LoadingDot extends Dot {
  LoadingDot({
    required super.dotAnimationController,
    required super.logoSize,
    required super.color,
    required super.errorColor,
  });

  @override
  Color get dotColor {
    final Animation<double> animation = CurvedAnimation(
      parent: dotAnimationController,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    );

    final Color middleColor = color.withOpacity(0.6);
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
    final forwardTween = Tween<double>(
      begin: super.getRadius(boxSize),
      end: boxSize.width / 2,
    );
    final reverseTween = Tween<double>(
      begin: boxSize.width / 2,
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
