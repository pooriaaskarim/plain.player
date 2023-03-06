import 'package:flutter/material.dart';

import 'dot_painter.dart';

class SuccessDotPainter extends DotPainter {
  SuccessDotPainter({
    required super.dotAnimationController,
    required super.logoSize,
    required super.themeData,
  });

  @override
  void paint(final Canvas canvas, final Size size) {
    super.paint(canvas, size);
    dotAnimationController.forward();
  }

  @override
  Offset getDotOffset({required final Size boxSize}) {
    final Animation<double> animation = CurvedAnimation(
      parent: dotAnimationController,
      curve: Curves.easeIn,
    );

    final Offset startPoint = Offset(boxSize.width / 2, boxSize.height / 2);
    final Offset middlePoint = Offset(
      boxSize.width / 2,
      -boxSize.height * 3,
    );
    final Offset endPoint = Offset(
      boxSize.width / 2 + (boxSize.width / 15),
      boxSize.height / 2 - (boxSize.height / 2),
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
  Color get dotColor {
    final Animation<double> animation = CurvedAnimation(
      parent: dotAnimationController,
      curve: Curves.easeIn,
    );
    const double opacityBegin = 0.4;
    const double opacityEnd = 1.0;
    return themeData.colorScheme.primary.withOpacity(
      Tween<double>(begin: opacityBegin, end: opacityEnd).evaluate(animation),
    );
  }

  @override
  double getDotRadius(final Size boxSize) {
    final Animation<double> animation = CurvedAnimation(
      parent: dotAnimationController,
      curve: Curves.easeIn,
    );
    return Tween<double>(begin: boxSize.width / 2, end: logoSize.width / 10)
        .evaluate(
      animation,
    );
  }

  @override
  Tween<double> get loadingEndBetween => Tween<double>(begin: 0.5, end: 1);
}
