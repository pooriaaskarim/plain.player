import 'package:flutter/material.dart';

import '../../../models/splash_screen_status.dart';
import 'error_dot_painter.dart';
import 'initializing_dot_painter.dart';
import 'loading_dot_painter.dart';
import 'success_dot_painter.dart';

abstract class DotPainter extends CustomPainter {
  DotPainter({
    required this.dotAnimationController,
    required this.themeData,
    required this.logoSize,
  });
  factory DotPainter.state(
    final SplashScreenStatus state, {
    required final AnimationController dotAnimationController,
    required final Size logoSize,
    required final ThemeData themeData,
  }) {
    switch (state) {
      case SplashScreenStatus.initializing:
        return InitializingDotPainter(
          dotAnimationController: dotAnimationController,
          logoSize: logoSize,
          themeData: themeData,
        );
      case SplashScreenStatus.loading:
        return LoadingDotPainter(
          dotAnimationController: dotAnimationController,
          logoSize: logoSize,
          themeData: themeData,
        );
      case SplashScreenStatus.success:
        return SuccessDotPainter(
          dotAnimationController: dotAnimationController,
          logoSize: logoSize,
          themeData: themeData,
        );
      case SplashScreenStatus.error:
        return ErrorDotPainter(
          dotAnimationController: dotAnimationController,
          logoSize: logoSize,
          themeData: themeData,
        );
    }
  }

  final AnimationController dotAnimationController;
  final Size logoSize;
  final ThemeData themeData;

  /// void paint() from CustomPainter class
  @override
  void paint(final Canvas canvas, final Size size) {
    canvas.drawCircle(
      getDotOffset(boxSize: size),
      getDotRadius(size),
      Paint()..color = dotColor,
    );
  }

  double logoDistanceFromScreenEdge(final Size boxSize) =>
      (boxSize.width - logoSize.width) / 2;
  @override
  bool shouldRepaint(covariant final CustomPainter oldDelegate) => true;

  /// Override [loadingEndBetween] with a (1 >= value >= 0) that represents
  /// the loading position
  Tween<double> get loadingEndBetween;

  /// Dot radius
  double getDotRadius(final Size boxSize) => (boxSize.width / 2) * 0.9;

  /// Dot Color
  Color get dotColor;

  /// Dot Position
  Offset getDotOffset({required final Size boxSize});
}
