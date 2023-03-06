import 'package:flutter/material.dart';

import '../../../../models/splash_screen_status.dart';
import 'error_dot.dart';
import 'initializing_dot.dart';
import 'loading_dot.dart';
import 'success_dot.dart';

abstract class Dot {
  const Dot({
    required this.dotAnimationController,
    required this.logoSize,
    required this.color,
    required this.errorColor,
  });
  factory Dot.from(
    final SplashScreenStatus status, {
    required final AnimationController dotAnimationController,
    required final Size logoSize,
    required final Color color,
    required final Color errorColor,
  }) {
    switch (status) {
      case SplashScreenStatus.initializing:
        return InitializingDot(
          dotAnimationController: dotAnimationController,
          logoSize: logoSize,
          color: color,
          errorColor: errorColor,
        );
      case SplashScreenStatus.loading:
        return LoadingDot(
          dotAnimationController: dotAnimationController,
          logoSize: logoSize,
          color: color,
          errorColor: errorColor,
        );
      case SplashScreenStatus.success:
        return SuccessDot(
          dotAnimationController: dotAnimationController,
          logoSize: logoSize,
          color: color,
          errorColor: errorColor,
        );
      case SplashScreenStatus.error:
        return ErrorDot(
          dotAnimationController: dotAnimationController,
          logoSize: logoSize,
          color: color,
          errorColor: errorColor,
        );
    }
  }

  final AnimationController dotAnimationController;
  final Size logoSize;
  final Color color;
  final Color errorColor;

  Future<void> get animate;

  /// Dot radius
  double getRadius(final Size boxSize) => (boxSize.width / 2) * 0.9;

  /// Dot Color
  Color get dotColor => color.withOpacity(0.3);

  /// Dot Position
  Offset getOffset({required final Size boxSize}) =>
      Offset(boxSize.width / 2, boxSize.height / 2);
}
