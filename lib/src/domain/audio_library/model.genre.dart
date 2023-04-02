import 'package:isar/isar.dart';

import '../../infrastructure/utils/app.utils.dart';
import 'model.track.dart';

part 'model.genre.g.dart';

@Collection()
class Genre {
  Genre({
    required this.genre,
  });
  Id get id => AppUtils.fastHash(genre);

  @Index(
    unique: true,
    caseSensitive: false,
    replace: true,
  )
  String genre;
  @Backlink(to: 'genre')
  IsarLinks<Track> tracks = IsarLinks<Track>();
}
