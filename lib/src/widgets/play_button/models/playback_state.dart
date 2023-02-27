import 'package:flutter/material.dart';

enum PlaybackState { play, pause, stop, loading, seeking }

extension PlaybackExtentrions on PlaybackState {
  static Widget stopIcon(BuildContext context) => Icon(
        Icons.stop,
        color: Theme.of(context).colorScheme.onPrimary,
      );
  static Widget playIcon(BuildContext context) => Icon(Icons.play_arrow_sharp,
      color: Theme.of(context).colorScheme.onPrimary);
  static Widget pauseIcon(BuildContext context) =>
      Icon(Icons.pause, color: Theme.of(context).colorScheme.onPrimary);
  static Widget loadingIcon(BuildContext context) => CircularProgressIndicator(
        color: Theme.of(context).colorScheme.onPrimary,
        strokeWidth: 2,
      );
  static Widget seekingIcon(BuildContext context) =>
      Icon(Icons.forward, color: Theme.of(context).colorScheme.onPrimary);

  String get state {
    switch (this) {
      case PlaybackState.play:
        return 'playing';
      case PlaybackState.pause:
        return 'paused';
      case PlaybackState.stop:
        return 'stopped';
      case PlaybackState.loading:
        return 'loading';
      case PlaybackState.seeking:
        return 'seeking';
    }
  }

  Widget widget(BuildContext context) {
    switch (this) {
      case PlaybackState.play:
        return playIcon(context);
      case PlaybackState.pause:
        return pauseIcon(context);
      case PlaybackState.stop:
        return stopIcon(context);
      case PlaybackState.loading:
        return loadingIcon(context);
      case PlaybackState.seeking:
        return seekingIcon(context);
    }
  }
}
