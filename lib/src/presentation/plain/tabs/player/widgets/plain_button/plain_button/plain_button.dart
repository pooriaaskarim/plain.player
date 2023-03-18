import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../models/enum.plain_button_state.dart';
import 'actions/next.dart';
import 'actions/previous.dart';
import 'actions/repeat.dart';
import 'actions/seek_backward.dart';
import 'actions/seek_forward.dart';
import 'actions/shuffle.dart';
import 'playbacks/buffering_paused.dart';
import 'playbacks/buffering_playing.dart';
import 'playbacks/idle.dart';
import 'playbacks/loading_paused.dart';
import 'playbacks/loading_playing.dart';
import 'playbacks/paused.dart';
import 'playbacks/playing.dart';
import 'playbacks/stopped.dart';

abstract class PlainButton {
  const PlainButton({required this.tooltipMessage});

  factory PlainButton.playback(final AudioPlayer audioPlayer) {
    final PlainButtonState state = audioPlayer.getPlainButtonState;
    switch (state) {
      case PlainButtonState.playing:
        return Playing();
      case PlainButtonState.paused:
        return Paused();
      case PlainButtonState.stopped:
        return Stopped();
      case PlainButtonState.loadingPaused:
        return LoadingPaused();
      case PlainButtonState.loadingPlaying:
        return LoadingPlaying();
      case PlainButtonState.bufferingPaused:
        return BufferingPaused();
      case PlainButtonState.bufferingPlaying:
        return BufferingPlaying();
      default:
        return Idle();
    }
  }
  factory PlainButton.next() => Next();
  factory PlainButton.previous() => Previous();
  factory PlainButton.repeat() => Repeat();
  factory PlainButton.seekBackward() => SeekBackward();
  factory PlainButton.seekForward() => SeekForward();
  factory PlainButton.shuffle() => Shuffle();

  final String tooltipMessage;
  // final AudioPlayer audioPlayer;
  Widget widget(final BuildContext context);
  void Function()? onPressed({
    required final AudioPlayer audioPlayer,
    required final AnimationController parentAnimationController,
  });
  void Function()? onLongPressed({
    required final AudioPlayer audioPlayer,
    required final AnimationController parentAnimationController,
  });
}
