import 'package:flutter/material.dart';

class LogoCustomPainter extends CustomPainter {
  const LogoCustomPainter({
    required this.loadingAnimation,
    required this.themeData,
    required this.logoSize,
  });
  final Animation<double> loadingAnimation;
  final ThemeData themeData;
  final Size logoSize;

  @override
  void paint(final Canvas canvas, final Size size) {
    final double logoDistanceFromScreenEdge = (size.width - logoSize.width) / 2;
    final loadingStrokeWidth = logoSize.width * (8 / 500);

    paintDotCircle(
      canvas: canvas,
      boxSize: size,
      radius: logoSize.width,
      color: themeData.colorScheme.tertiary.withOpacity(0.4),
    );
    paintLoadingBar(
      canvas: canvas,
      logoDistanceFromScreenEdge: logoDistanceFromScreenEdge,
      boxSize: size,
      loadingStrokeWidth: loadingStrokeWidth,
      color: themeData.colorScheme.primary,
    );
  }

  void paintDotCircle({
    required final Canvas canvas,
    required final Size boxSize,
    required final Color color,
    required final double radius,
  }) {
    canvas.drawCircle(
      getDotCircleOffset(boxSize: boxSize),
      radius,
      getDotCirclePainter(color: color),
    );
  }

  Paint getDotCirclePainter({
    required final Color color,
  }) =>
      Paint()..color = color;

  Offset getDotCircleOffset({
    required final Size boxSize,
  }) =>
      Offset(boxSize.width / 2, boxSize.height / 2);

  void paintLoadingBar({
    required final Canvas canvas,
    required final Color color,
    required final Size boxSize,
    required final double loadingStrokeWidth,
    required final double logoDistanceFromScreenEdge,
  }) {
    canvas
      ..drawLine(
        getLeftLoadingBarStartPoint(
          logoDistanceFromScreenEdge: logoDistanceFromScreenEdge,
          boxSize: boxSize,
        ),
        getLeftLoadingBarEndPoint(
          logoDistanceFromScreenEdge: logoDistanceFromScreenEdge,
          boxSize: boxSize,
          loadingAnimation: loadingAnimation,
        ),
        getLoadingPainter(
          color: color,
          strokeWidth: loadingStrokeWidth,
        ),
      )
      ..drawLine(
        getRightLoadingBarStartPoint(
          logoDistanceFromScreenEdge: logoDistanceFromScreenEdge,
          boxSize: boxSize,
        ),
        getRightLoadingBarEndPoint(
          logoDistanceFromScreenEdge: logoDistanceFromScreenEdge,
          boxSize: boxSize,
          loadingAnimation: loadingAnimation,
        ),
        getLoadingPainter(
          color: color,
          strokeWidth: loadingStrokeWidth,
        ),
      );
  }

  Offset getLeftLoadingBarStartPoint({
    required final Size boxSize,
    required final double logoDistanceFromScreenEdge,
    final int correctionFactor = 10,
  }) =>
      Offset(
        logoDistanceFromScreenEdge + correctionFactor,
        boxSize.height / 2,
      );

  Offset getLeftLoadingBarEndPoint({
    required final Size boxSize,
    required final double logoDistanceFromScreenEdge,
    required final Animation<double> loadingAnimation,
  }) =>
      Offset(
        logoDistanceFromScreenEdge - (loadingAnimation.value * boxSize.width),
        boxSize.height / 2,
      );

  Offset getRightLoadingBarStartPoint({
    required final Size boxSize,
    required final double logoDistanceFromScreenEdge,
    final int correctionFactor = 10,
  }) =>
      Offset(
        logoDistanceFromScreenEdge + logoSize.width - correctionFactor,
        boxSize.height / 2,
      );

  Offset getRightLoadingBarEndPoint({
    required final Size boxSize,
    required final double logoDistanceFromScreenEdge,
    required final Animation<double> loadingAnimation,
  }) =>
      Offset(
        (logoDistanceFromScreenEdge + logoSize.width - 5) +
            (loadingAnimation.value * boxSize.width),
        boxSize.height / 2,
      );

  Paint dotCirclePainter({required final Color color}) => Paint()
    ..style = PaintingStyle.fill
    ..color = color;

  Paint getLoadingPainter({
    required final Color color,
    required final double strokeWidth,
  }) =>
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..color = color;

  @override
  bool shouldRepaint(covariant final CustomPainter oldDelegate) => true;
}
