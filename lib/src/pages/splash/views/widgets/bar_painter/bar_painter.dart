import 'package:flutter/material.dart';

import '../../../models/splash_screen_status.dart';
import 'error_bar_painter.dart';
import 'initializing_bar_painter.dart';
import 'loading_bar_painter.dart';
import 'success_bar_painter.dart';

abstract class BarPainter extends CustomPainter {
  BarPainter({
    required this.loadingBarAnimationController,
    required this.logoSize,
    required this.themeData,
  });
  factory BarPainter.state(
    final SplashScreenStatus state, {
    required final AnimationController loadingAnimationController,
    required final Size logoSize,
    required final ThemeData themeData,
  }) {
    switch (state) {
      case SplashScreenStatus.initializing:
        return InitializingBarPainter(
          loadingBarAnimationController: loadingAnimationController,
          logoSize: logoSize,
          themeData: themeData,
        );
      case SplashScreenStatus.loading:
        return LoadingBarPainter(
          loadingBarAnimationController: loadingAnimationController,
          logoSize: logoSize,
          themeData: themeData,
        );
      case SplashScreenStatus.success:
        return SuccessBarPainter(
          loadingBarAnimationController: loadingAnimationController,
          logoSize: logoSize,
          themeData: themeData,
        );
      case SplashScreenStatus.error:
        return ErrorBarPainter(
          loadingBarAnimationController: loadingAnimationController,
          logoSize: logoSize,
          themeData: themeData,
        );
    }
  }

  final AnimationController loadingBarAnimationController;
  final Size logoSize;
  final ThemeData themeData;

  double get strokeWidth => logoSize.width * (8 / 500);
  Color get loadingBarsColor => themeData.colorScheme.primary;
  int get correctionFactor => logoSize.width ~/ 10;

  double logoDistanceFromScreenEdge(final Size boxSize) =>
      (boxSize.width - logoSize.width) / 2;

  /// void paint() from CustomPainter class
  @override
  void paint(final Canvas canvas, final Size size) {
    canvas
      ..drawLine(
        loadingBarLeftStart(size),
        loadingBarLeftEnd(size),
        loadingBarPainter(),
      )
      ..drawLine(
        loadingBarRightStart(size),
        loadingBarRightEnd(size),
        loadingBarPainter(),
      );
  }

  @override
  bool shouldRepaint(covariant final CustomPainter oldDelegate) => true;

  Offset loadingBarLeftStart(final Size boxSize) => Offset(
        logoDistanceFromScreenEdge(boxSize) + correctionFactor,
        boxSize.height / 2,
      );
  Offset loadingBarLeftEnd(final Size boxSize) {
    final animation = CurvedAnimation(
      parent: loadingBarAnimationController,
      curve: Curves.easeInOut,
    );
    return Tween<Offset>(
      begin: loadingBarLeftStart(boxSize),
      end: Offset(
        0,
        boxSize.height / 2,
      ),
    ).evaluate(loadingEndBetween.animate(animation));
  }

  Offset loadingBarRightStart(final Size boxSize) => Offset(
        logoDistanceFromScreenEdge(boxSize) + logoSize.width - correctionFactor,
        boxSize.height / 2,
      );
  Offset loadingBarRightEnd(final Size boxSize) {
    final animation = CurvedAnimation(
      parent: loadingBarAnimationController,
      curve: Curves.easeInOut,
    );
    return Tween<Offset>(
      begin: loadingBarRightStart(boxSize),
      end: Offset(
        boxSize.width,
        boxSize.height / 2,
      ),
    ).evaluate(loadingEndBetween.animate(animation));
  }

  Paint loadingBarPainter() => Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth
    ..color = loadingBarsColor;

  /// Override [loadingEndBetween] with a (1 >= value >= 0) that represents
  /// the loading position
  Tween<double> get loadingEndBetween;
}
