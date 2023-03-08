import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../plain_button.dart';

class LoadingPaused implements PlainButton {
  @override
  final String tooltipMessage = 'Loading/Paused';

  @override
  void Function()? onLongPressed({
    required final AudioPlayer audioPlayer,
    required final AnimationController parentAnimationController,
  }) =>
      null;

  @override
  void Function()? onPressed({
    required final AudioPlayer audioPlayer,
    required final AnimationController parentAnimationController,
  }) =>
      () {
        audioPlayer.play();
      };

  @override
  Widget widget(final BuildContext context) => Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.passthrough,
        children: [
          CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onPrimary,
            strokeWidth: 2,
          ),
          Icon(
            Icons.pause,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      );
}
