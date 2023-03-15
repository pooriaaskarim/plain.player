import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/splash/splash.bloc.dart';
import '../../../../application/splash/splash.state.dart';
import '../../../../domain/splash/splash_screen_status.enum.dart';
import 'bar_painter/bar.painter.dart';
import 'dot_painter/dot.painter.dart';
import 'logo/logo.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({
    this.scaleDownFactor = 2.1,
    super.key,
  });
  final double scaleDownFactor;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with TickerProviderStateMixin {
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
  Widget build(final BuildContext context) {
    final Color logoColor = Theme.of(context).colorScheme.onBackground;
    final Color loadColor = Theme.of(context).colorScheme.primary;
    final Color errorColor = Theme.of(context).colorScheme.error;

    final double screenWidth = MediaQuery.of(context).size.width;
    final Size logoSize = Size(
      screenWidth / widget.scaleDownFactor,
      screenWidth / (widget.scaleDownFactor * 2),
    );
    final Size boxSize = Size(screenWidth, logoSize.height);

    return BlocListener<SplashBloc, SplashState>(
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
              size: boxSize,
              painter: DotPainter.from(
                splashScreenState,
                logoColor: logoColor,
                loadColor: loadColor,
                errorColor: errorColor,
                logoSize: logoSize,
                dotAnimationController: _dotAnimationController,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _barAnimationController,
            builder: (final context, final child) => CustomPaint(
              size: boxSize,
              painter: BarPainter.from(
                splashScreenState,
                logoColor: logoColor,
                loadColor: loadColor,
                errorColor: errorColor,
                logoSize: logoSize,
                barAnimationController: _barAnimationController,
              ),
            ),
          ),
          Logo(
            logoSize: logoSize,
            context: context,
          ),
        ],
      ),
    );
  }

  Future<void> _resetLoadingAnimation() async {
    _barAnimationController.reset();
    await _barAnimationController.forward();
  }
}
