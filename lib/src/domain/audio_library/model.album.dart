import 'package:isar/isar.dart';

import '../../infrastructure/utils/app.utils.dart';
import 'model.track.dart';

part 'model.album.g.dart';

@Collection()
class Album {
  Album({
    required this.name,
  });
  Id get id => AppUtils.fastHash(name);

  @Index(
    unique: true,
  )
  String name;

  @Backlink(to: 'album')
  IsarLinks<Track> tracks = IsarLinks<Track>();
}
