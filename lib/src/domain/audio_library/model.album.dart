import 'package:isar/isar.dart';

import 'model.track.dart';

part 'model.album.g.dart';

@Collection()
class Album {
  Album({
    required this.name,
  });
  Id id = Isar.autoIncrement;

  @Index(
    unique: true,
    replace: false,
  )
  String name;

  @Backlink(to: 'album')
  IsarLinks<Track> tracks = IsarLinks<Track>();

  @override
  String toString() => name;
}
