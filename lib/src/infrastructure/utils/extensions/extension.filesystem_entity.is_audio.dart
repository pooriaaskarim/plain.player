import 'dart:io';

import 'package:mime/mime.dart';

extension IsAudio on FileSystemEntity {
  List<String> get supportedAudioMimeExtensions => [
        'audio/mpeg',
        'audio/mpeg-L1',
        'audio/mpeg-L2',
        'audio/mp4',
        'audio/x-matroska',
        'audio/flac',
        'audio/x-flac',
        'audio/vorbis',
        'audio/wav',
        'audio/ogg',
        'audio/mp4a-latm',
        'audio/aac',
        'audio/ac3',
        'audio/ac4',
        'audio/alac',
        'audio/g711-alaw',
        'audio/amr',
        'audio/3gpp',
        'audio/opus',
        'audio/raw',
        'audio/webm',
      ];
  bool get isDirectory =>
      FileSystemEntity.typeSync(path) == FileSystemEntityType.directory;
  bool get isAudio =>
      lookupMimeType(path) != null &&
      lookupMimeType(path)!.toLowerCase().startsWith('audio/');

  bool get isSupportedAudio {
    if (lookupMimeType(path) != null) {
      for (final String ext in supportedAudioMimeExtensions) {
        if (lookupMimeType(path)!.toLowerCase() == ext) {
          return true;
        }
      }
    }
    return false;
  }
}
