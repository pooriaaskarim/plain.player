import 'package:isar/isar.dart';

import '../../infrastructure/utils/app.utils.dart';
import 'model.track.dart';

part 'model.artist.g.dart';

@Collection()
class Artist {
  Artist({required this.name});
  Id get id => AppUtils.fastHash(name);
  @Index(
    unique: true,
  )
  String name;
  // List albums;
  @Backlink(to: 'artist')
  IsarLinks<Track> tracks = IsarLinks<Track>();
}
