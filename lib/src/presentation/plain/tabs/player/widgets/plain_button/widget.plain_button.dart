import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../../../infrastructure/utils/app.sizes.dart';
import 'plain_button/plain_button.dart';

class PlainButtonWidget extends StatefulWidget {
  const PlainButtonWidget({
    required this.audioPlayer,
    this.backgroundColor,
    this.elevation,
    this.size,
    super.key,
  });

  final AudioPlayer audioPlayer;
  final Color? backgroundColor;
  final double? elevation;
  final double? size;

  @override
  PlainButtonWidgetState createState() => PlainButtonWidgetState();
}

class PlainButtonWidgetState extends State<PlainButtonWidget>
    with SingleTickerProviderStateMixin {
  late ButtonStyle buttonStyle;
  late Color _backgroundColor;
  late double _elevation;
  late double _size;

  late final AnimationController _animationController;
  final Duration _animationDuration = const Duration(
    seconds: 1,
  );

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
      lowerBound: 0.3,
      upperBound: 1.0,
      animationBehavior: AnimationBehavior.preserve,
    )..forward();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();
    _backgroundColor = widget.backgroundColor ?? Theme.of(context).primaryColor;
    _size = widget.size ?? 2 * AppSizes.points_40;
    _elevation = widget.elevation ?? 1;
    buttonStyle = ButtonStyle(
      alignment: Alignment.center,
      animationDuration: Duration.zero,
      backgroundColor: MaterialStateProperty.all(_backgroundColor),
      elevation: MaterialStateProperty.all(_elevation),
      fixedSize: MaterialStateProperty.all(Size(_size, _size)),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      shape: MaterialStateProperty.all(const CircleBorder()),
    );
    return StreamBuilder<PlayerState>(
      stream: widget.audioPlayer.playerStateStream,
      builder: (final context, final snapshot) {
        final PlainButton plainButton =
            PlainButton.playback(widget.audioPlayer);

        return Tooltip(
          key: tooltipKey,
          message: plainButton.tooltipMessage,
          triggerMode: TooltipTriggerMode.manual,
          preferBelow: false,
          child: ElevatedButton(
            onPressed: () {
              plainButton
                  .onPressed(
                    audioPlayer: widget.audioPlayer,
                    parentAnimationController: _animationController,
                  )
                  ?.call();
              _replayAnimation(_animationController);
            },
            onLongPress: () {
              tooltipKey.currentState?.ensureTooltipVisible();
              plainButton
                  .onLongPressed(
                    audioPlayer: widget.audioPlayer,
                    parentAnimationController: _animationController,
                  )
                  ?.call();
            },
            style: buttonStyle,
            child: AnimatedBuilder(
              builder: (final context, final child) => Opacity(
                opacity: _animationController.value,
                child: child,
              ),
              animation: _animationController,
              child: plainButton.widget(context),
            ),
          ),
        );
      },
    );
  }

  void _replayAnimation(final AnimationController animationController) {
    animationController
      ..reset()
      ..forward();
  }
}
