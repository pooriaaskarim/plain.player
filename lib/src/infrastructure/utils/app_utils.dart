import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

class AppUtils {
  static const double zero = 0;
  static const double tinySize = mediumSize / 8;
  static const double xSmallSize = mediumSize / 4;
  static const double smallSize = mediumSize / 2;
  static const double mediumSize = 16.0;
  static const double largeSize = mediumSize * 2;
  static const double xLargeSize = mediumSize * 4;

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
     ------------------------------------------
     
     
     ''');
  }
}
