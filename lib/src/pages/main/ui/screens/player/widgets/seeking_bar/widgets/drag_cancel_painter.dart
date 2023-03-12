import 'package:flutter/material.dart';

class DragCancelPainter extends CustomPainter {
  DragCancelPainter({required this.offset});
  Offset offset;

  @override
  void paint(final Canvas canvas, final Size size) => canvas.drawCircle(
        offset,
        size.width / 2,
        Paint()..color = Colors.red,
      );

  @override
  bool shouldRepaint(final CustomPainter oldDelegate) => true;

  @override
  bool hitTest(final Offset position) {
    const Offset center = Offset(200, 200);
    final Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(center: center, width: 400, height: 400),
          Radius.circular(center.dx),
        ),
      )
      ..close();
    return path.contains(position);
  }
}
