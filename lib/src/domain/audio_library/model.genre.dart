import 'package:isar/isar.dart';

import 'model.track.dart';

part 'model.genre.g.dart';

@Collection()
class Genre {
  Genre({
    required this.genre,
  });
  Id id = Isar.autoIncrement;

  @Index(
    unique: true,
    caseSensitive: false,
    replace: false,
  )
  String genre;
  @Backlink(to: 'genre')
  IsarLinks<Track> tracks = IsarLinks<Track>();

  @override
  String toString() => genre;
}
