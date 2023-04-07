import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/splash/cubit.splash.dart';
import '../../../../application/splash/state/state.splash.dart';
import 'bar_painter/painter.bar.dart';
import 'dot_painter/painter.dot.dart';
import 'logo/widget.logo.dart';

class SplashLoading extends StatefulWidget {
  const SplashLoading({
    required this.animationDuration,
    this.scaleDownFactor = 2.1,
    super.key,
  });
  final double scaleDownFactor;
  final Duration animationDuration;

  @override
  State<SplashLoading> createState() => _SplashLoadingState();
}

class _SplashLoadingState extends State<SplashLoading>
    with TickerProviderStateMixin {
  late AnimationController _barAnimationController;
  late AnimationController _dotAnimationController;

  @override
  void initState() {
    super.initState();

    _barAnimationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
      upperBound: 1.0,
      lowerBound: 0.0,
      animationBehavior: AnimationBehavior.preserve,
      value: 0,
    );
    _dotAnimationController = AnimationController(
      duration: widget.animationDuration,
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

    return BlocBuilder<SplashCubit, SplashState>(
      buildWhen: (final previous, final current) =>
          // Rebuild only on new state.runtimeType
          previous.runtimeType != current.runtimeType,
      builder: (final context, final state) {
        _resetAnimations();

        return Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _dotAnimationController,
              builder: (final context, final child) => CustomPaint(
                size: boxSize,
                painter: DotPainter.from(
                  state,
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
                  state,
                  logoColor: logoColor,
                  loadColor: loadColor,
                  errorColor: errorColor,
                  logoSize: logoSize,
                  barAnimationController: _barAnimationController,
                ),
              ),
            ),
            LogoWidget(
              logoSize: logoSize,
              context: context,
            ),
          ],
        );
      },
    );
  }

  Future<void> _resetAnimations() async {
    _barAnimationController.reset();
    _dotAnimationController.reset();
  }
}
