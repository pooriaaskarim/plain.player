import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../plain_button.dart';

class Shuffle implements PlainButton {
  @override
  final String tooltipMessage = 'Shuffle';

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
        audioPlayer.setShuffleModeEnabled(!audioPlayer.shuffleModeEnabled);
      };

  @override
  Widget widget(final BuildContext context) => Icon(
        Icons.shuffle, //todo
        color: Theme.of(context).colorScheme.onPrimary,
      );
}
