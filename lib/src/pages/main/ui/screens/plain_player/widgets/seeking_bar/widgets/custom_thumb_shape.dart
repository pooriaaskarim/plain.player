import 'package:flutter/material.dart';

import 'drag_cancel_painter.dart';

class CustomThumbShape extends SliderComponentShape {
  CustomThumbShape({
    required this.isTouched,
    required this.min,
    this.max,
    this.thumbWidth = 5,
  });

  bool isTouched;
  final double min;
  final double? max;
  final double thumbWidth;

  final Color _thumbColorFallBack = Colors.blue;
  final double _trackHeightFallBack = 20.0;
  @override
  Size getPreferredSize(final bool isEnabled, final bool isDiscrete) =>
      Size.fromRadius(thumbWidth);

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

    final TextSpan textSpan = TextSpan(
      style: sliderTheme.valueIndicatorTextStyle,
      text: getValue(value),
    );
    labelPainter
      ..text = textSpan
      ..textAlign = TextAlign.center
      ..textDirection = textDirection
      ..layout();
    final Offset textOffset = Offset(
      center.dx - (labelPainter.width / 2),
      center.dy - ((sliderTheme.trackHeight ?? _trackHeightFallBack) * 0.8),
    );
    final Offset dragCancelOffset = Offset(
      center.dx,
      center.dy + ((sliderTheme.trackHeight ?? _trackHeightFallBack) * 0.8),
    );

    final Offset p1 = Offset(
      center.dx,
      center.dy + (sliderTheme.trackHeight ?? _trackHeightFallBack) / 2,
    );
    final Offset p2 = Offset(
      center.dx,
      center.dy - (sliderTheme.trackHeight ?? _trackHeightFallBack) / 2,
    );

    canvas.drawLine(p1, p2, paint);
    if (isTouched) {
      labelPainter.paint(
        canvas,
        textOffset,
      );
      DragCancelPainter(offset: dragCancelOffset)
          .paint(canvas, const Size(20, 20));
    }
  }

  String? getValue(final double value) {
    if (max == null) {
      return null;
    } else {
      final Duration position =
          Duration(microseconds: (min + (max! - min) * value).round());
      //Get position time string as HH:MM:SS
      String buffer = position.toString().split('.').first.padLeft(8, '0');
      //Cut out HH int HH:MM:SS if doesn't exceed an hour
      if (buffer.split(':').first == '00') {
        buffer = buffer.substring(3, 8);
      }
      return buffer;
    }
  }
}
