import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../plain_button.dart';

class Repeat implements PlainButton {
  @override
  final String tooltipMessage = 'Repeat';
  final List<LoopMode> loopModes = [...LoopMode.values];
  LoopMode get loopMode => loopModes.first;

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
        loopModes.add(loopModes.removeAt(0));
        audioPlayer.setLoopMode(loopMode);
      };

  @override
  Widget widget(final BuildContext context) => Icon(
        Icons.repeat, //todo
        color: Theme.of(context).colorScheme.onPrimary,
      );
}
