import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../plain_button.dart';

class Next implements PlainButton {
  @override
  final String tooltipMessage = 'Next';

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
      (audioPlayer.nextIndex == null)
          ? null
          : () {
              audioPlayer.seekToNext();
            };

  @override
  Widget widget(final BuildContext context) => Icon(
        Icons.skip_next,
        color: Theme.of(context).colorScheme.onPrimary,
      );
}
