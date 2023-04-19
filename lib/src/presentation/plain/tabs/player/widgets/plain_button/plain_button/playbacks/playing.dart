import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../plain_button.dart';

class Playing implements PlainButton {
  @override
  final String tooltipMessage = 'Tap to toggle Pause/Play\n'
      'Hold to Stop';

  @override
  void Function()? onLongPressed({
    required final AudioPlayer audioPlayer,
    required final AnimationController parentAnimationController,
  }) =>
      () {
        audioPlayer
          ..stop()
          ..seek(const Duration(seconds: 0));
      };

  @override
  void Function()? onPressed({
    required final AudioPlayer audioPlayer,
    required final AnimationController parentAnimationController,
  }) =>
      () {
        audioPlayer.pause();
        // _replayAnimation();
      };

  @override
  Widget widget(final BuildContext context) => Icon(
        Icons.pause,
        color: Theme.of(context).colorScheme.onPrimary,
      );
}
