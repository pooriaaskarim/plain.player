import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../plain_button.dart';

class Idle implements PlainButton {
  @override
  final String tooltipMessage = 'Idle';

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
      null;

  @override
  Widget widget(final BuildContext context) => Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.onPrimary,
      );
}
