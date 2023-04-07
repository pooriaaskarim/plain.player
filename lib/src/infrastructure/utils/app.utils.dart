import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

import 'app.sizes.dart';

class AppUtils {
  AppUtils._();

  ///returns a SizedBox of height [size] with a default of AppUtils.mediumSize
  static Widget verticalSpacer({final double size = AppSizes.points_16}) =>
      SizedBox(
        height: size,
      );

  ///returns a SizedBox of width [size] with a default of AppUtils.mediumSize
  static Widget horizontalSpacer({final double size = AppSizes.points_16}) =>
      SizedBox(
        width: size,
      );

  static Future<void> fakeDelay([
    final Duration duration = const Duration(seconds: 1),
  ]) async {
    await Future.delayed(duration);
  }

  static Widget get emptyWidget => const SizedBox.shrink();

  static void debugPrintAudioPlayerDetails(
    final AudioPlayer audioPlayer,
  ) {
    debugPrint('''
     -----------------------------------------
     Duration: ${audioPlayer.duration}
     Position: ${audioPlayer.position}
     BufferedPosition: ${audioPlayer.bufferedPosition}
     ProcessingState: ${audioPlayer.processingState}
     icyMetadata: ${audioPlayer.icyMetadata?.headers?.name}
     ------------------------------------------
     ''');
  }

  /// FNV-1a 64bit hash algorithm optimized for Dart Strings
  static int fastHash(final String string) {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < string.length) {
      final codeUnit = string.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}
