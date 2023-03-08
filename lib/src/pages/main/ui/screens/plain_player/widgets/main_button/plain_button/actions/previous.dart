import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../plain_button.dart';

class Previous implements PlainButton {
  @override
  final String tooltipMessage = 'Previous';

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
      (audioPlayer.previousIndex == null)
          ? null
          : () {
              audioPlayer.seekToPrevious();
            };

  @override
  Widget widget(final BuildContext context) => Icon(
        Icons.skip_previous,
        color: Theme.of(context).colorScheme.onPrimary,
      );
}
