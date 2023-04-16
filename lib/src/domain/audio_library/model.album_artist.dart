import 'package:isar/isar.dart';

import 'model.track.dart';

part 'model.album_artist.g.dart';

@Collection()
class AlbumArtist {
  AlbumArtist({required this.name});
  Id id = Isar.autoIncrement;
  @Index(
    unique: true,
    replace: false,
  )
  String name;
  @Backlink(to: 'albumArtist')
  IsarLinks<Track> tracks = IsarLinks<Track>();

  @override
  String toString() => name;
}
