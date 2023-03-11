import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

class AppUtils {
  AppUtils._();

  static const double _baseSize = 8.0;
  static const double zero = 0.0;
  static const double tinySize = _baseSize / 2;
  static const double smallSize = _baseSize;
  static const double mediumSize = _baseSize * 2;
  static const double largeSize = _baseSize * 3;
  static const double xLargeSize = _baseSize * 4;
  static const double xxLargeSize = _baseSize * 6;
  static const double xxxLargeSize = _baseSize * 8;

  ///returns a SizedBox of height [size] with a default of AppUtils.mediumSize
  static Widget verticalSpacer({final double size = mediumSize}) => SizedBox(
        height: size,
      );

  ///returns a SizedBox of width [size] with a default of AppUtils.mediumSize
  static Widget horizontalSpacer({final double size = mediumSize}) => SizedBox(
        width: size,
      );

  static Future<void> fakeDelay({final int seconds = 2}) async {
    await Future.delayed(Duration(seconds: seconds));
  }

  static Widget get emtyWidget => const SizedBox.shrink();

  static void debugPrintAudioPlayerDetails(
    final AudioPlayer audioPlayer,
  ) {
    debugPrint('''
    
    
     -----------------------------------------
     Duration: ${audioPlayer.duration}
     Position: ${audioPlayer.position}
     BufferedPosition: ${audioPlayer.bufferedPosition}
     ProcessingState: ${audioPlayer.processingState}
     Events: ${audioPlayer.playbackEvent}
     Events: ${audioPlayer.audioSource}
     ------------------------------------------
     
     
     ''');
  }
}
