import 'dart:io';

import 'package:isar/isar.dart';

import 'model.track.dart';

part 'model.folder.g.dart';

@Collection(ignore: {'directory'})
class Folder {
  Folder({required this.path, this.isScanned = false});
  Id id = Isar.autoIncrement;
  @Index(
    unique: true,
    replace: false,
  )
  String path;
  bool isScanned;

  @Backlink(to: 'folder')
  IsarLinks<Track> tracks = IsarLinks<Track>();

  @Ignore()
  Directory get directory => Directory(path);
  @Ignore()
  String get name => path.split('/').last;
  @Ignore()
  int get totalTracks => tracks.length;
}
