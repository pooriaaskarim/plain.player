import 'package:flutter/material.dart';

import '../../../../../../../infrastructure/utils/app.sizes.dart';

class CustomThumbShape extends SliderComponentShape {
  CustomThumbShape({
    required this.isTouched,
    this.thumbWidth = AppSizes.points_4,
  });

  bool isTouched;
  final double thumbWidth;

  final Color _thumbColorFallBack = Colors.blue;
  final double _trackHeightFallBack = 2 * AppSizes.points_40;
  @override
  Size getPreferredSize(final bool isEnabled, final bool isDiscrete) =>
      isEnabled ? Size.fromRadius(thumbWidth) : Size.zero;

  @override
  void paint(
    final PaintingContext context,
    final Offset center, {
    required final Animation<double> activationAnimation,
    required final Animation<double> enableAnimation,
    required final RenderBox parentBox,
    required final Size sizeWithOverflow,
    required final SliderThemeData sliderTheme,
    required final TextDirection textDirection,
    required final TextPainter labelPainter,
    required final bool isDiscrete,
    required final double textScaleFactor,
    required final double value,
  }) {
    final Canvas canvas = context.canvas;
    final paint = Paint()
      ..color = sliderTheme.thumbColor ?? _thumbColorFallBack
      ..style = PaintingStyle.stroke
      ..strokeWidth = thumbWidth;

    labelPainter
      ..text = labelPainter.text
      ..textAlign = TextAlign.center
      ..textDirection = textDirection
      ..layout();
    final Offset textOffset = Offset(
      _getLabelDx(center, labelPainter, parentBox.size.width),
      (center.dy - ((sliderTheme.trackHeight ?? _trackHeightFallBack) / 2)) -
          AppSizes.points_32,
    );
    final Offset p1 = Offset(
      center.dx,
      center.dy + (sliderTheme.trackHeight ?? _trackHeightFallBack) / 2,
    );
    final Offset p2 = Offset(
      center.dx,
      center.dy - (sliderTheme.trackHeight ?? _trackHeightFallBack) / 2,
    );

    if (value > 0) {
      canvas.drawLine(p1, p2, paint);
    }
    if (isTouched) {
      labelPainter.paint(
        canvas,
        textOffset,
      );
    }
  }

  double _getLabelDx(
    final Offset center,
    final TextPainter labelPainter,
    final double trackWidth,
  ) {
    const double safeArea = AppSizes.points_4;
    final dx = center.dx - (labelPainter.size.width / 2);
    if (dx < 0) {
      return safeArea;
    }
    if (dx > (trackWidth - labelPainter.size.width)) {
      return trackWidth - labelPainter.size.width - safeArea;
    }
    return dx;
  }
}
