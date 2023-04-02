import 'dart:math';

import 'package:flutter/material.dart';

import '../../../infrastructure/utils/app.utils.dart';

class Loading extends StatefulWidget {
  const Loading({
    required this.color,
    this.radius = AppUtils.size_24Pt,
    super.key,
  });
  final Color color;
  final double radius;

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  Widget build(final BuildContext context) => AnimatedBuilder(
        animation: animationController,
        builder: (final context, final child) => CustomPaint(
          size: Size(widget.radius, widget.radius),
          painter: LoadingDot(
            color: widget.color,
            radius: widget.radius,
            animationController: animationController,
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      animationBehavior: AnimationBehavior.preserve,
      lowerBound: 0,
      upperBound: 1,
      vsync: this,
    )
      ..forward()
      ..repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class LoadingDot extends CustomPainter {
  const LoadingDot({
    required this.color,
    required this.radius,
    required this.animationController,
  });

  final AnimationController animationController;
  final double radius;
  final Color color;

  Color get loadingColor {
    final Animation<double> animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    );

    final Color middleColor = color.withOpacity(0.6);
    final Color startEndColor = color.withOpacity(0.4);
    final ColorTween forwardTween = ColorTween(
      begin: startEndColor,
      end: middleColor,
    );
    final ColorTween reverseTween = ColorTween(
      begin: middleColor,
      end: startEndColor,
    );

    return ColorTween(
      begin: forwardTween.evaluate(
        animation,
      ),
      end: reverseTween.evaluate(
        animation,
      ),
    ).evaluate(
      animation,
    )!;
  }

  double get loadingRadius {
    final Animation<double> animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOutSine,
    );

    final double middleRadius = 1.2 * radius;

    final forwardTween = Tween<double>(
      begin: radius,
      end: middleRadius,
    );
    final reverseTween = Tween<double>(
      begin: middleRadius,
      end: radius,
    );
    return Tween<double>(
      begin: forwardTween.evaluate(
        animation,
      ),
      end: reverseTween.evaluate(
        animation,
      ),
    ).evaluate(
      animation,
    );
  }

  double get strokeAngle {
    final Animation<double> animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    );

    final forwardTween = Tween<double>(
      begin: -(2 * pi),
      end: 0,
    );
    final reverseTween = Tween<double>(
      begin: 0,
      end: 2 * pi,
    );
    return Tween<double>(
      begin: forwardTween.evaluate(animation),
      end: reverseTween.evaluate(animation),
    ).evaluate(
      animation,
    );
  }

  Future<void> get animate => animationController.repeat();

  @override
  void paint(final Canvas canvas, final Size size) {
    animate;
    final Paint paint = Paint()..color = loadingColor;
    canvas
      ..drawCircle(
        Offset(size.width / 2, size.height / 2),
        loadingRadius,
        paint,
      )
      ..drawArc(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: radius + (loadingRadius / 3),
        ),
        strokeAngle,
        1,
        false,
        paint
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 1,
      );
  }

  @override
  bool shouldRepaint(covariant final CustomPainter oldDelegate) => true;
}
