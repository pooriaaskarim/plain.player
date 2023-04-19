import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../../../../../infrastructure/utils/app.sizes.dart';
import '../../../../../../../shared/widgets/widget.loading.dart';
import '../plain_button.dart';

class BufferingPaused implements PlainButton {
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
          Loading(
            color: Theme.of(context).colorScheme.primary,
            radius: AppSizes.points_40,
          ),
          Icon(
            Icons.pause,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      );

  @override
  final String tooltipMessage = 'Buffering/Paused';
}
