import 'package:flutter/material.dart';

import '../../../../../../../infrastructure/utils/app_utils.dart';
import '../../../../../models/splash_screen_status.dart';
import 'error_bar.dart';
import 'initializing_bar.dart';
import 'loading_bar.dart';
import 'success_bar.dart';

abstract class Bar {
  const Bar({
    required this.logoColor,
    required this.loadColor,
    required this.errorColor,
    required this.logoSize,
    required this.loadingBarAnimationController,
  });

  factory Bar.from(
    final SplashScreenStatus status, {
    required final Color logoColor,
    required final Color loadColor,
    required final Color errorColor,
    required final Size logoSize,
    required final AnimationController barAnimationController,
  }) {
    switch (status) {
      case SplashScreenStatus.initializing:
        return InitializingBar(
          logoColor: logoColor,
          loadColor: loadColor,
          errorColor: errorColor,
          loadingBarAnimationController: barAnimationController,
          logoSize: logoSize,
        );
      case SplashScreenStatus.loading:
        return LoadingBar(
          logoColor: logoColor,
          loadColor: loadColor,
          errorColor: errorColor,
          loadingBarAnimationController: barAnimationController,
          logoSize: logoSize,
        );
      case SplashScreenStatus.success:
        return SuccessBar(
          logoColor: logoColor,
          loadColor: loadColor,
          errorColor: errorColor,
          loadingBarAnimationController: barAnimationController,
          logoSize: logoSize,
        );
      case SplashScreenStatus.error:
        return ErrorBar(
          logoColor: logoColor,
          loadColor: loadColor,
          errorColor: errorColor,
          loadingBarAnimationController: barAnimationController,
          logoSize: logoSize,
        );
    }
  }

  double get strokeWidth => logoSize.width * (8 / 500);
  int get correctionFactor => logoSize.width ~/ 10;

  double logoDistanceFromScreenEdge(final Size boxSize) =>
      (boxSize.width - logoSize.width) / 2;

  final AnimationController loadingBarAnimationController;
  final Size logoSize;
  final Color logoColor;
  final Color loadColor;
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

  Paint leftPainter(final Size boxSize) {
    final double gradientLeft = 0.5 * logoDistanceFromScreenEdge(boxSize);
    final double gradientRight = logoDistanceFromScreenEdge(boxSize);
    const double gradientTop = AppUtils.zero;
    const double gradientBottom = AppUtils.zero;

    return Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = logoColor
      ..shader = LinearGradient(
        colors: gradientColors,
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
      ).createShader(
        Rect.fromLTRB(
          gradientLeft,
          gradientTop,
          gradientRight,
          gradientBottom,
        ),
      );
  }

  Paint rightPainter(final Size boxSize) {
    final double gradientLeft =
        logoDistanceFromScreenEdge(boxSize) + logoSize.width;
    final double gradientRight =
        gradientLeft + (0.5 * logoDistanceFromScreenEdge(boxSize));
    const double gradientTop = AppUtils.zero;
    const double gradientBottom = AppUtils.zero;

    return Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = logoColor
      ..shader = LinearGradient(
        colors: gradientColors,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(
        Rect.fromLTRB(
          gradientLeft,
          gradientTop,
          gradientRight,
          gradientBottom,
        ),
      );
  }

  List<Color> get gradientColors => [logoColor, loadColor.withOpacity(0.3)];

  /// Override [loadingEndBetween] with a (1 >= value >= 0) that represents
  /// the loading position
  Tween<double> get loadingEndBetween;
}
