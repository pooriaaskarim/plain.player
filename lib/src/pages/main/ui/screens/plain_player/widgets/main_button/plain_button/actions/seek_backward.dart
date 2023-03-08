import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../plain_button.dart';

class SeekBackward implements PlainButton {
  @override
  final String tooltipMessage = 'Seek Backward';

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
      (audioPlayer.duration == null)
          ? null
          : () {
              audioPlayer.seek(audioPlayer.duration); //todo
            };

  @override
  Widget widget(final BuildContext context) => Icon(
        Icons.telegram, //todo
        color: Theme.of(context).colorScheme.onPrimary,
      );
}
