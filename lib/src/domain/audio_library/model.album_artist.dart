import 'package:isar/isar.dart';

import '../../infrastructure/utils/app.utils.dart';
import 'model.track.dart';

part 'model.album_artist.g.dart';

@Collection()
class AlbumArtist {
  AlbumArtist({required this.name});
  Id get id => AppUtils.fastHash(name);
  @Index(
    unique: true,
  )
  String name;
  // List albums;
  @Backlink(to: 'albumArtist')
  IsarLinks<Track> tracks = IsarLinks<Track>();
}
