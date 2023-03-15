import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../plain_button.dart';

class Completed implements PlainButton {
  @override
  final String tooltipMessage = 'Completed';
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
        audioPlayer.seek(
          Duration.zero,
          index: audioPlayer.effectiveIndices!.first,
        );
      };

  @override
  Widget widget(final BuildContext context) => Icon(
        Icons.stop,
        color: Theme.of(context).colorScheme.onPrimary,
      );
}
