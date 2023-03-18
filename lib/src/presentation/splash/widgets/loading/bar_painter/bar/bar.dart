import 'package:flutter/material.dart';

import '../../../../../../application/splash/splash.state.dart';
import '../../../../../../infrastructure/utils/app_utils.dart';
import 'error.bar.dart';
import 'initializing.bar.dart';
import 'loading.bar.dart';
import 'success.bar.dart';

abstract class Bar {
  const Bar({
    required this.logoColor,
    required this.loadColor,
    required this.errorColor,
    required this.logoSize,
    required this.barAnimationController,
  });

  factory Bar.from(
    final SplashState state, {
    required final Color logoColor,
    required final Color loadColor,
    required final Color errorColor,
    required final Size logoSize,
    required final AnimationController barAnimationController,
  }) {
    switch (state.runtimeType) {
      case AppLaunchState:
        return InitializingBar(
          logoColor: logoColor,
          loadColor: loadColor,
          errorColor: errorColor,
          barAnimationController: barAnimationController,
          logoSize: logoSize,
        );
      case LoadingState:
        return LoadingBar(
          logoColor: logoColor,
          loadColor: loadColor,
          errorColor: errorColor,
          barAnimationController: barAnimationController,
          logoSize: logoSize,
        );
      case SuccessState:
        return SuccessBar(
          logoColor: logoColor,
          loadColor: loadColor,
          errorColor: errorColor,
          barAnimationController: barAnimationController,
          logoSize: logoSize,
        );
      case ErrorState:
        return ErrorBar(
          logoColor: logoColor,
          loadColor: loadColor,
          errorColor: errorColor,
          barAnimationController: barAnimationController,
          logoSize: logoSize,
        );
      default:
        return InitializingBar(
          logoColor: logoColor,
          loadColor: loadColor,
          errorColor: errorColor,
          barAnimationController: barAnimationController,
          logoSize: logoSize,
        );
    }
  }

  double get strokeWidth => logoSize.width * (8 / 500);
  int get correctionFactor => logoSize.width ~/ 10;

  double logoDistanceFromScreenEdge(final Size boxSize) =>
      (boxSize.width - logoSize.width) / 2;

  final AnimationController barAnimationController;
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
      parent: barAnimationController,
      curve: Curves.ease,
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
    final Animation<double> animation = CurvedAnimation(
      parent: barAnimationController,
      curve: Curves.ease,
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

  Future<void> get animate async {
    await barAnimationController.forward();
  }

  List<Color> get gradientColors => [logoColor, loadColor.withOpacity(0.3)];

  /// Override [loadingEndBetween] with a (1 >= value >= 0) that represents
  /// the loading position
  Tween<double> get loadingEndBetween;
}
