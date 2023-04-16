import 'package:isar/isar.dart';

import 'model.track.dart';

part 'model.year.g.dart';

@Collection()
class Year {
  Year({
    required this.year,
  });
  Id id = Isar.autoIncrement;
  @Index(
    unique: true,
    caseSensitive: false,
    replace: false,
  )
  String year;
  @Backlink(to: 'year')
  IsarLinks<Track> tracks = IsarLinks<Track>();

  @override
  String toString() => year;
}
