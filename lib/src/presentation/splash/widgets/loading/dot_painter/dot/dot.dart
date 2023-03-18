import 'package:flutter/material.dart';

import '../../../../../../application/splash/state.splash.dart';
import 'dot.error.dart';
import 'dot.initializing.dart';
import 'dot.loading.dart';
import 'dot.success.dart';

abstract class Dot {
  const Dot({
    required this.logoColor,
    required this.loadColor,
    required this.errorColor,
    required this.logoSize,
    required this.dotAnimationController,
  });
  factory Dot.from(
    final SplashState state, {
    required final Color logoColor,
    required final Color loadColor,
    required final Color errorColor,
    required final Size logoSize,
    required final AnimationController dotAnimationController,
  }) {
    switch (state.runtimeType) {
      case AppLaunchState:
        return InitializingDot(
          logoColor: logoColor,
          loadColor: loadColor,
          errorColor: errorColor,
          logoSize: logoSize,
          dotAnimationController: dotAnimationController,
        );
      case LoadingState:
        return LoadingDot(
          logoColor: logoColor,
          loadColor: loadColor,
          errorColor: errorColor,
          logoSize: logoSize,
          dotAnimationController: dotAnimationController,
        );
      case SuccessState:
        return SuccessDot(
          logoColor: logoColor,
          loadColor: loadColor,
          errorColor: errorColor,
          logoSize: logoSize,
          dotAnimationController: dotAnimationController,
        );
      case ErrorState:
        return ErrorDot(
          logoColor: logoColor,
          loadColor: loadColor,
          errorColor: errorColor,
          logoSize: logoSize,
          dotAnimationController: dotAnimationController,
        );
      default:
        return InitializingDot(
          logoColor: logoColor,
          loadColor: loadColor,
          errorColor: errorColor,
          logoSize: logoSize,
          dotAnimationController: dotAnimationController,
        );
    }
  }

  final AnimationController dotAnimationController;
  final Size logoSize;
  final Color loadColor;
  final Color logoColor;
  final Color errorColor;

  Future<void> get animate;

  /// Dot radius
  double getRadius(final Size boxSize) => logoSize.width / 4;

  /// Dot Color
  Color get dotColor => loadColor.withOpacity(0.3);

  /// Dot Position
  Offset getOffset({required final Size boxSize}) => Offset(
        boxSize.width / 2 + (logoSize.width / 6.5),
        boxSize.height / 2 - (logoSize.height / 2.1),
      );
}
