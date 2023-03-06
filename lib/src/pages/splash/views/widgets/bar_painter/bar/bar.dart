import 'package:flutter/material.dart';

import '../../../../models/splash_screen_status.dart';
import 'error_bar.dart';
import 'initializing_bar.dart';
import 'loading_bar.dart';
import 'success_bar.dart';

abstract class Bar {
  const Bar({
    required this.loadingBarAnimationController,
    required this.logoSize,
    required this.color,
    required this.errorColor,
  });

  factory Bar.from(
    final SplashScreenStatus status, {
    required final AnimationController barAnimationController,
    required final Size logoSize,
    required final Color color,
    required final Color errorColor,
  }) {
    switch (status) {
      case SplashScreenStatus.initializing:
        return InitializingBar(
          loadingBarAnimationController: barAnimationController,
          logoSize: logoSize,
          color: color,
          errorColor: errorColor,
        );
      case SplashScreenStatus.loading:
        return LoadingBar(
          loadingBarAnimationController: barAnimationController,
          logoSize: logoSize,
          color: color,
          errorColor: errorColor,
        );
      case SplashScreenStatus.success:
        return SuccessBar(
          loadingBarAnimationController: barAnimationController,
          logoSize: logoSize,
          color: color,
          errorColor: errorColor,
        );
      case SplashScreenStatus.error:
        return ErrorBar(
          loadingBarAnimationController: barAnimationController,
          logoSize: logoSize,
          color: color,
          errorColor: errorColor,
        );
    }
  }

  double get strokeWidth => logoSize.width * (8 / 500);
  Color get loadingBarsColor => color;
  int get correctionFactor => logoSize.width ~/ 10;

  double logoDistanceFromScreenEdge(final Size boxSize) =>
      (boxSize.width - logoSize.width) / 2;

  final AnimationController loadingBarAnimationController;
  final Size logoSize;
  final Color color;
  final Color errorColor;

  Offset leftStart(final Size boxSize) => Offset(
        logoDistanceFromScreenEdge(boxSize) + correctionFactor,
        boxSize.height / 2,
      );
  Offset leftEnd(final Size boxSize) {
    final animation = CurvedAnimation(
      parent: loadingBarAnimationController,
      curve: Curves.easeInOut,
    );
    return Tween<Offset>(
      begin: leftStart(boxSize),
      end: Offset(
        0,
        boxSize.height / 2,
      ),
    ).evaluate(loadingEndBetween.animate(animation));
  }

  Offset rightStart(final Size boxSize) => Offset(
        logoDistanceFromScreenEdge(boxSize) + logoSize.width - correctionFactor,
        boxSize.height / 2,
      );
  Offset rightEnd(final Size boxSize) {
    final animation = CurvedAnimation(
      parent: loadingBarAnimationController,
      curve: Curves.easeInOut,
    );
    return Tween<Offset>(
      begin: rightStart(boxSize),
      end: Offset(
        boxSize.width,
        boxSize.height / 2,
      ),
    ).evaluate(loadingEndBetween.animate(animation));
  }

  Paint rightPainter(final Size boxSize) => Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth
    ..color = loadingBarsColor;
  Paint leftPainter(final Size boxSize) => Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth
    ..color = loadingBarsColor;

  /// Override [loadingEndBetween] with a (1 >= value >= 0) that represents
  /// the loading position
  Tween<double> get loadingEndBetween;
}
