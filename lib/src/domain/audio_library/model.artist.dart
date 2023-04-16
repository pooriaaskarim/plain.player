import 'package:isar/isar.dart';

import 'model.track.dart';

part 'model.artist.g.dart';

@Collection()
class Artist {
  Artist({required this.name});
  Id id = Isar.autoIncrement;
  @Index(
    unique: true,
    replace: false,
  )
  String name;
  @Backlink(to: 'artist')
  IsarLinks<Track> tracks = IsarLinks<Track>();

  @override
  String toString() => name;
}
