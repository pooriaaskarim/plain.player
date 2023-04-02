import 'dart:io';

import 'package:isar/isar.dart';

part 'model.folder.g.dart';

@Collection(ignore: {'directory'})
class Folder {
  Folder({required this.path});
  Id id = Isar.autoIncrement;
  @Index(
    unique: true,
    replace: true,
  )
  String path;

  @Ignore()
  Directory get directory => Directory(path);
}
