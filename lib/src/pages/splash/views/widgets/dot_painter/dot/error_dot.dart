import 'package:flutter/material.dart';

import 'dot.dart';

class ErrorDot extends Dot {
  const ErrorDot({
    required super.dotAnimationController,
    required super.logoSize,
    required super.color,
    required super.errorColor,
  });
  @override
  Offset getOffset({required final Size boxSize}) {
    final Animation<double> animation = CurvedAnimation(
      parent: dotAnimationController,
      curve: Curves.easeIn,
    );

    final Offset startPoint = super.getOffset(boxSize: boxSize);
    final Offset middlePoint = Offset(
      boxSize.width / 2,
      -boxSize.height * 3,
    );
    final Offset endPoint = Offset(
      boxSize.width / 2 + (logoSize.width / 6.5),
      boxSize.height / 2 - (logoSize.height / 2.1),
    );
    return Tween<Offset>(
      begin: Tween<Offset>(
        begin: startPoint,
        end: middlePoint,
      ).evaluate(animation),
      end: Tween<Offset>(
        begin: middlePoint,
        end: endPoint,
      ).evaluate(animation),
    ).evaluate(animation);
  }

  @override
  double getRadius(final Size boxSize) {
    final Animation<double> animation = CurvedAnimation(
      parent: dotAnimationController,
      curve: Curves.easeIn,
    );
    return Tween<double>(
      begin: super.getRadius(boxSize),
      end: logoSize.width / 4,
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
