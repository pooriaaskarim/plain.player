import 'package:just_audio/just_audio.dart';

enum PlainButtonState {
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

extension MapToPlainButtonState on AudioPlayer {
  PlainButtonState get getPlainButtonState {
    final ProcessingState processingState = playerState.processingState;
    final bool playing = playerState.playing;

    switch (processingState) {
      case ProcessingState.completed:
        return PlainButtonState.completed;
      case ProcessingState.buffering:
        return playing
            ? PlainButtonState.bufferingPlaying
            : PlainButtonState.bufferingPaused;

      case ProcessingState.loading:
        return playing
            ? PlainButtonState.loadingPlaying
            : PlainButtonState.loadingPaused;
      case ProcessingState.ready:
        return playing ? PlainButtonState.playing : PlainButtonState.paused;
      case ProcessingState.idle:
        /** Based on JustAudio documentations
            PlayerState(true, ProcessingState.idle) corresponds to player being
            unset, and PlayerState(false, ProcessingState.idle) corresponds to
            player being stopped **/
        return playing ? PlainButtonState.idle : PlainButtonState.stopped;
    }
  }
}
