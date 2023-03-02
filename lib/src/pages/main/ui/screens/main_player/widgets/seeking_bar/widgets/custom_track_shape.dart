import 'package:flutter/material.dart';

class CustomTrackShape extends SliderTrackShape {
  /// The Track is divided into three segments:
  /// ACTIVE and INACTIVE which get painted on Canvas by
  /// [paintLeftSegment] and [paintRightSegment] based on TextDirection of context,
  /// and a BUFFER that is painted if [hasBuffer] is true
  /// BUFFER's position is calculated from the nullable [secondaryValue]

  const CustomTrackShape({
    required this.hasBuffer,
    required this.max,
    required this.min,
    this.secondaryValue,
  });
  final bool hasBuffer;
  final double min;
  final double max;
  final double? secondaryValue;

  @override
  Rect getPreferredRect({
    required final RenderBox parentBox,
    required final SliderThemeData sliderTheme,
    final bool isDiscrete = true,
    final bool isEnabled = true,
    final Offset offset = Offset.zero,
  }) {
    final double overlayWidth =
        sliderTheme.overlayShape!.getPreferredSize(isEnabled, isDiscrete).width;
    final double trackHeight = sliderTheme.trackHeight ?? 20;
    final double trackLeft = offset.dx + overlayWidth / 2;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    // Although this works for a material, perhaps the default
    // rectangular track should be padded not just by the overlay, but by the
    // max of the thumb and the overlay, in case there is no overlay.
    final double trackWidth = parentBox.size.width - overlayWidth;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    final PaintingContext context,
    final Offset offset, {
    required final RenderBox parentBox,
    required final SliderThemeData sliderTheme,
    required final Animation<double> enableAnimation,
    required final Offset thumbCenter,
    required final TextDirection textDirection,
    final Offset? secondaryOffset,
    final bool isEnabled = true,
    final bool isDiscrete = true,
  }) {
    if (sliderTheme.trackHeight == 0) {
      return;
    }
    final Rect trackRectangle = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    paintLeftSegment(
      enableAnimation: enableAnimation,
      canvas: context.canvas,
      thumbCenter: thumbCenter,
      trackRectangle: trackRectangle,
      sliderThemeData: sliderTheme,
      textDirection: textDirection,
    );
    if (hasBuffer) {
      paintBufferSegment(
        canvas: context.canvas,
        thumbCenter: thumbCenter,
        trackRectangle: trackRectangle,
        sliderThemeData: sliderTheme,
        textDirection: textDirection,
      );
    }
    paintRightSegment(
      enableAnimation: enableAnimation,
      canvas: context.canvas,
      thumbCenter: thumbCenter,
      trackRectangle: trackRectangle,
      sliderThemeData: sliderTheme,
      textDirection: textDirection,
    );
  }

  Paint getActiveSegmentPaint({
    required final SliderThemeData sliderThemeData,
    required final Animation<double> enableAnimation,
  }) {
    final ColorTween activeTrackColorTween = ColorTween(
      begin: sliderThemeData.disabledActiveTrackColor,
      end: sliderThemeData.activeTrackColor,
    );

    return Paint()..color = activeTrackColorTween.evaluate(enableAnimation)!;
  }

  Paint getInactiveSegmentPaint({
    required final SliderThemeData sliderThemeData,
    required final Animation<double> enableAnimation,
  }) {
    final ColorTween inactiveTrackColorTween = ColorTween(
      begin: sliderThemeData.disabledInactiveTrackColor,
      end: sliderThemeData.inactiveTrackColor,
    );

    return Paint()..color = inactiveTrackColorTween.evaluate(enableAnimation)!;
  }

  Rect getBufferSegment({
    required final Offset thumbCenter,
    required final Rect trackRectangle,
    required final TextDirection textDirection,
    final int verticalPadding = 5,
  }) {
    final Rect bufferSegment;
    switch (textDirection) {
      case TextDirection.ltr:
        bufferSegment = Rect.fromLTRB(
          thumbCenter.dx,
          trackRectangle.top + verticalPadding,
          (getBufferedToDurationRatio() ?? 0) * (trackRectangle.longestSide),
          trackRectangle.bottom - verticalPadding,
        );
        break;
      case TextDirection.rtl:
        bufferSegment = Rect.fromLTRB(
          (getBufferedToDurationRatio() ?? 0) * (trackRectangle.longestSide),
          trackRectangle.top + verticalPadding,
          thumbCenter.dx,
          trackRectangle.bottom - verticalPadding,
        );
        break;
    }
    return bufferSegment;
  }

  Paint getBufferSegmentPaint({
    required final SliderThemeData sliderThemeData,
  }) {
    final Color bufferingTrackColor =
        sliderThemeData.secondaryActiveTrackColor!;

    return Paint()..color = bufferingTrackColor;
  }

  void paintBufferSegment({
    required final Canvas canvas,
    required final Offset thumbCenter,
    required final Rect trackRectangle,
    required final SliderThemeData sliderThemeData,
    required final TextDirection textDirection,
    final int verticalPadding = 5,
  }) =>
      canvas.drawRect(
        getBufferSegment(
          thumbCenter: thumbCenter,
          trackRectangle: trackRectangle,
          textDirection: textDirection,
        ),
        getBufferSegmentPaint(sliderThemeData: sliderThemeData),
      );

  Rect getLeftSegment({
    required final Rect trackRectangle,
    required final Offset thumbCenter,
  }) =>
      Rect.fromLTRB(
        trackRectangle.left,
        trackRectangle.top,
        thumbCenter.dx,
        trackRectangle.bottom,
      );

  void paintLeftSegment({
    required final Animation<double> enableAnimation,
    required final Canvas canvas,
    required final Offset thumbCenter,
    required final Rect trackRectangle,
    required final SliderThemeData sliderThemeData,
    required final TextDirection textDirection,
  }) {
    final Rect leftSegment = getLeftSegment(
      trackRectangle: trackRectangle,
      thumbCenter: thumbCenter,
    );
    switch (textDirection) {
      case TextDirection.ltr:
        canvas.drawRect(
          leftSegment,
          getActiveSegmentPaint(
            sliderThemeData: sliderThemeData,
            enableAnimation: enableAnimation,
          ),
        );
        break;
      case TextDirection.rtl:
        canvas.drawRect(
          leftSegment,
          getInactiveSegmentPaint(
            sliderThemeData: sliderThemeData,
            enableAnimation: enableAnimation,
          ),
        );
        break;
    }
  }

  Rect getRightSegment({
    required final Offset thumbCenter,
    required final Rect trackRectangle,
  }) =>
      Rect.fromLTRB(
        thumbCenter.dx,
        trackRectangle.top,
        trackRectangle.right,
        trackRectangle.bottom,
      );

  void paintRightSegment({
    required final Animation<double> enableAnimation,
    required final Canvas canvas,
    required final Offset thumbCenter,
    required final Rect trackRectangle,
    required final SliderThemeData sliderThemeData,
    required final TextDirection textDirection,
  }) {
    final Rect rightSegment = getRightSegment(
      thumbCenter: thumbCenter,
      trackRectangle: trackRectangle,
    );
    switch (textDirection) {
      case TextDirection.ltr:
        canvas.drawRect(
          rightSegment,
          getInactiveSegmentPaint(
            sliderThemeData: sliderThemeData,
            enableAnimation: enableAnimation,
          ),
        );
        break;
      case TextDirection.rtl:
        canvas.drawRect(
          rightSegment,
          getActiveSegmentPaint(
            sliderThemeData: sliderThemeData,
            enableAnimation: enableAnimation,
          ),
        );
        break;
    }
  }

  num? getBufferedToDurationRatio() {
    if (secondaryValue != null) {
      return (secondaryValue!) / max;
    }
    return null;
  }
}
