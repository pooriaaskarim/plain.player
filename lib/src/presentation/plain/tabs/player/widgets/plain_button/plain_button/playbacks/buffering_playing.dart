import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../../../../../infrastructure/utils/app.sizes.dart';
import '../../../../../../../shared/widgets/widget.loading.dart';
import '../plain_button.dart';

class BufferingPlaying implements PlainButton {
  @override
  final String tooltipMessage = 'Buffering/Playing';

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
        audioPlayer.pause();
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
            Icons.play_arrow_sharp,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      );
}
