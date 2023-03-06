import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/splash_screen_bloc.dart';
import '../../bloc/splash_screen_state.dart';
import '../../models/splash_screen_status.dart';
import 'bar_painter/bar_painter.dart';
import 'dot_painter/dot_painter.dart';
import 'logo/logo.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({
    required this.screenWidth,
    required this.themeData,
    this.scaleDownFactor = 2.1,
    super.key,
  });
  final double scaleDownFactor;
  final ThemeData themeData;
  final double screenWidth;
  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with TickerProviderStateMixin {
  Size get _logoSize => Size(
        widget.screenWidth / widget.scaleDownFactor,
        widget.screenWidth / (widget.scaleDownFactor * 2),
      );
  Size get _boxSize => Size(widget.screenWidth, _logoSize.height);

  late AnimationController _barAnimationController;
  late AnimationController _dotAnimationController;
  final Duration _animationDuration = const Duration(
    seconds: 1,
  );
  SplashScreenStatus splashScreenState = SplashScreenStatus.initializing;

  @override
  void initState() {
    super.initState();

    _barAnimationController = AnimationController(
      duration: _animationDuration,
      vsync: this,
      upperBound: 1.0,
      lowerBound: 0.0,
      animationBehavior: AnimationBehavior.preserve,
      value: 0,
    );
    _dotAnimationController = AnimationController(
      duration: _animationDuration,
      vsync: this,
      upperBound: 1.0,
      lowerBound: 0.0,
      animationBehavior: AnimationBehavior.preserve,
      value: 0,
    );
  }

  @override
  void dispose() {
    _barAnimationController.dispose();
    _dotAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) =>
      BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (final context, final state) async {
          splashScreenState = state.status;
          await _resetLoadingAnimation();
        },
        child: Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _dotAnimationController,
              builder: (final context, final child) => CustomPaint(
                size: _boxSize,
                painter: DotPainter.from(
                  splashScreenState,
                  dotAnimationController: _dotAnimationController,
                  logoSize: _logoSize,
                  color: widget.themeData.colorScheme.primary,
                  errorColor: widget.themeData.colorScheme.error,
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _barAnimationController,
              builder: (final context, final child) => CustomPaint(
                size: _boxSize,
                painter: BarPainter.from(
                  splashScreenState,
                  barAnimationController: _barAnimationController,
                  logoSize: _logoSize,
                  color: widget.themeData.colorScheme.primary,
                  errorColor: widget.themeData.colorScheme.error,
                ),
              ),
            ),
            Logo(
                logoSize: _logoSize,
                color: widget.themeData.colorScheme.primary),
          ],
        ),
      );

  Future<void> _resetLoadingAnimation() async {
    _barAnimationController.reset();
    await _barAnimationController.forward();
  }
}
