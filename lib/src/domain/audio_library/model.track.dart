import 'package:audiotagger/models/tag.dart';
import 'package:isar/isar.dart';

import 'model.album.dart';
import 'model.album_artist.dart';
import 'model.artist.dart';
import 'model.genre.dart';
import 'model.year.dart';

part 'model.track.g.dart';

@Collection()
class Track {
  /// An [Track] file at which resides at the given [path]
  Track({
    required this.path,
  });

  /// Create an [Track] object from a [Tag] object.
  factory Track.fromTag({required final String path, required final Tag tag}) {
    const String unknown = '<UNKNOWN>';

    return Track(
      path: path,
    )
      ..lyrics = tag.lyrics
      ..title = tag.title
      ..trackNumber = tag.trackNumber
      ..trackTotal = tag.trackTotal
      ..album.value = (tag.album == null) ? null : Album(name: tag.album!)
      ..artist.value = Artist(name: tag.artist ?? unknown)
      ..albumArtist.value = AlbumArtist(
        name: tag.albumArtist ?? unknown,
      )
      ..genre.value = Genre(genre: tag.genre ?? unknown)
      ..year.value = (tag.year == null) ? null : Year(year: tag.year!);
  }

  Id id = Isar.autoIncrement;

  /// [Track]'s [path]
  String path;

  /// [title] of the track
  String? title;

  /// Number of the track ([trackNumber]) in the [album]
  String? trackNumber;

  /// Total number of tracks ([trackTotal]) in the [album]
  String? trackTotal;

  /// [lyrics] of the track
  String? lyrics;

  /// [albumArtist] of the album
  IsarLink<AlbumArtist> albumArtist = IsarLink<AlbumArtist>();

  /// [artist] of the track
  IsarLink<Artist> artist = IsarLink<Artist>();

  /// [genre] of the track
  IsarLink<Genre> genre = IsarLink<Genre>();

  /// [album] of the track
  IsarLink<Album> album = IsarLink<Album>();

  /// [year] of publication
  IsarLink<Year> year = IsarLink<Year>();
}

// /// Create an [Track] object from a Map<String, String> of the tags.
// factory Track.fromMap({
//   required final String path,
//   required final Map<String, String> map,
// }) =>
//     Track(
//       path: path,
//       title: map["title"],
//       artist: map["artist"],
//       genre: map["genre"],
//       trackNumber: map["trackNumber"],
//       trackTotal: map["trackTotal"],
//       discNumber: map["discNumber"],
//       discTotal: map["discTotal"],
//       lyrics: map["lyrics"],
//       comment: map["comment"],
//       album: map["album"],
//       albumArtist: map["albumArtist"],
//       year: map["year"],
//       artwork: map["artwork"],
//     );
