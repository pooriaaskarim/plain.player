import 'package:just_audio/just_audio.dart';

extension HasBuffer on AudioPlayer {
  bool get hasBuffer {
    if (audioSource == null) {
      return false;
    } else {
      return (audioSource as ProgressiveAudioSource?)!.uri.hasScheme;
    }
  }
}
