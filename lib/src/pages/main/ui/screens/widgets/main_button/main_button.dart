import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'models/playback_state.dart';

class MainButton extends StatefulWidget {
  const MainButton({
    required this.audioPlayer,
    this.backGroundColor,
    this.elevation,
    this.size,
    super.key,
  });
  final AudioPlayer audioPlayer;
  final Color? backGroundColor;
  final double? elevation;
  final double? size;

  @override
  MainButtonState createState() => MainButtonState();
}

class MainButtonState extends State<MainButton>
    with SingleTickerProviderStateMixin {
  late ButtonStyle buttonStyle;
  late Color backgroundColor;
  late double elevation;
  late double size;
  late AudioPlayer _audioPlayer;

  late final AnimationController _animationController;
  final Duration _animationDuration = const Duration(
    seconds: 1,
  );

  @override
  void initState() {
    _audioPlayer = widget.audioPlayer;
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
    backgroundColor = widget.backGroundColor ?? Theme.of(context).primaryColor;
    size = widget.size ?? 100.0;
    elevation = widget.elevation ?? 1;

    buttonStyle = ButtonStyle(
      alignment: Alignment.center,
      animationDuration: Duration.zero,
      backgroundColor: MaterialStateProperty.all(backgroundColor),
      elevation: MaterialStateProperty.all(elevation),
      fixedSize: MaterialStateProperty.all(Size(size, size)),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      shape: MaterialStateProperty.all(const CircleBorder()),
    );

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

    return StreamBuilder<PlayerState>(
      stream: _audioPlayer.playerStateStream,
      builder: (final context, final snapshot) {
        final MainButtonWidget widget = MainButtonWidget(_audioPlayer);
        return Tooltip(
          key: tooltipKey,
          message: widget.tooltipMessage,
          triggerMode: TooltipTriggerMode.manual,
          preferBelow: false,
          child: ElevatedButton(
            onPressed: () {
              widget
                  .onPressed(
                    audioPlayer: _audioPlayer,
                    parentAnimationController: _animationController,
                  )
                  ?.call();
              _replayAnimation(_animationController);
            },
            onLongPress: () {
              tooltipKey.currentState?.ensureTooltipVisible();
              widget
                  .onLongPressed(
                    audioPlayer: _audioPlayer,
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
              child: widget.create(context),
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
