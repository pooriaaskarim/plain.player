import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

enum MainButtonState {
  playing,
  paused,
  stopped,
  completed,
  loadingPaused,
  loadingPlaying,
  bufferingPaused,
  bufferingPlaying,
  idle,
}

extension GetMainButtonState on MainButtonState {
  static MainButtonState getState(final AudioPlayer audioPlayer) {
    final ProcessingState processingState =
        audioPlayer.playerState.processingState;
    final bool playing = audioPlayer.playerState.playing;
    switch (processingState) {
      case ProcessingState.completed:
        return MainButtonState.completed;
      case ProcessingState.buffering:
        return playing
            ? MainButtonState.bufferingPlaying
            : MainButtonState.bufferingPaused;

      case ProcessingState.loading:
        return playing
            ? MainButtonState.loadingPlaying
            : MainButtonState.loadingPaused;
      case ProcessingState.ready:
        return playing ? MainButtonState.playing : MainButtonState.paused;
      case ProcessingState.idle:
        /** Based on JustAudio documentations
            PlayerState(true, ProcessingState.idle) corresponds to player being
            unset, and PlayerState(false, ProcessingState.idle) corresponds to
            player being stopped **/
        return playing ? MainButtonState.idle : MainButtonState.stopped;
      default:
        return MainButtonState.stopped;
    }
  }
}

abstract class MainButtonWidget {
  factory MainButtonWidget(final AudioPlayer audioPlayer) {
    final MainButtonState state = GetMainButtonState.getState(audioPlayer);
    switch (state) {
      case MainButtonState.playing:
        return Playing();
      case MainButtonState.paused:
        return Paused();
      case MainButtonState.stopped:
        return Stopped();
      case MainButtonState.loadingPaused:
        return LoadingPaused();
      case MainButtonState.loadingPlaying:
        return LoadingPlaying();
      case MainButtonState.bufferingPaused:
        return BufferingPaused();
      case MainButtonState.bufferingPlaying:
        return BufferingPlaying();
      default:
        return Idle();
    }
  }
  late String tooltipMessage;
  Widget create(final BuildContext context);
  void Function()? onPressed({
    required final AudioPlayer audioPlayer,
    required final AnimationController parentAnimationController,
  });
  void Function()? onLongPressed({
    required final AudioPlayer audioPlayer,
    required final AnimationController parentAnimationController,
  });
}

class BufferingPaused implements MainButtonWidget {
  @override
  String tooltipMessage = 'Buffering/Paused';

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
  Widget create(final BuildContext context) => Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.passthrough,
        children: [
          CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onPrimary,
            strokeWidth: 2,
          ),
          Icon(
            Icons.pause,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      );
}

class BufferingPlaying implements MainButtonWidget {
  @override
  String tooltipMessage = 'Buffering/Playing';

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
  Widget create(final BuildContext context) => Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.passthrough,
        children: [
          CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onPrimary,
            strokeWidth: 2,
          ),
          Icon(
            Icons.play_arrow_sharp,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      );
}

class Completed implements MainButtonWidget {
  @override
  String tooltipMessage = 'Completed';
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
  Widget create(final BuildContext context) => Icon(
        Icons.stop,
        color: Theme.of(context).colorScheme.onPrimary,
      );
}

class Idle implements MainButtonWidget {
  @override
  String tooltipMessage = 'Idle';

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
  Widget create(final BuildContext context) => Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.onPrimary,
      );
}

class LoadingPaused implements MainButtonWidget {
  @override
  String tooltipMessage = 'Loading/Paused';

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
  Widget create(final BuildContext context) => Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.passthrough,
        children: [
          CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onPrimary,
            strokeWidth: 2,
          ),
          Icon(
            Icons.pause,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      );
}

class LoadingPlaying implements MainButtonWidget {
  @override
  String tooltipMessage = 'Loading/Playing';

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
  Widget create(final BuildContext context) => Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.passthrough,
        children: [
          CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onPrimary,
            strokeWidth: 2,
          ),
          Icon(
            Icons.play_arrow_sharp,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      );
}

class Paused implements MainButtonWidget {
  @override
  String tooltipMessage = 'Tap to toggle Pause/Play\n'
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
        audioPlayer.play();
      };

  @override
  Widget create(final BuildContext context) => Icon(
        Icons.pause,
        color: Theme.of(context).colorScheme.onPrimary,
      );
}

class Playing implements MainButtonWidget {
  @override
  String tooltipMessage = 'Tap to toggle Pause/Play\n'
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
  Widget create(final BuildContext context) => Icon(
        Icons.play_arrow_sharp,
        color: Theme.of(context).colorScheme.onPrimary,
      );
}

class Stopped implements MainButtonWidget {
  @override
  String tooltipMessage = 'Stopped';

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
        audioPlayer
          ..seek(Duration.zero)
          ..play();
      };

  @override
  Widget create(final BuildContext context) => Icon(
        Icons.stop,
        color: Theme.of(context).colorScheme.onPrimary,
      );
}
