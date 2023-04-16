import 'package:audiotagger/models/tag.dart';
import 'package:isar/isar.dart';

import 'model.album.dart';
import 'model.album_artist.dart';
import 'model.artist.dart';
import 'model.folder.dart';
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
  factory Track.fromTag({
    required final String path,
    required final Tag tag,
  }) {
    const String unknown = '<UNKNOWN>';

    return Track(
      path: path,
    )
      ..lyrics = tag.lyrics
      ..title = tag.title
      ..trackNumber = tag.trackNumber
      ..trackTotal = tag.trackTotal
      ..album.value = (tag.album != null && tag.album!.isNotEmpty)
          ? Album(name: tag.album!)
          : null
      ..artist.value = (tag.artist != null && tag.artist!.isNotEmpty)
          ? Artist(name: tag.artist!)
          : Artist(name: unknown)
      ..albumArtist.value =
          (tag.albumArtist != null && tag.albumArtist!.isNotEmpty)
              ? AlbumArtist(name: tag.albumArtist!)
              : AlbumArtist(name: unknown)
      ..genre.value = (tag.genre != null && tag.genre!.isNotEmpty)
          ? Genre(genre: tag.genre!)
          : Genre(genre: unknown)
      ..year.value = (tag.year != null && tag.year!.isNotEmpty)
          ? Year(year: tag.year!)
          : null;
  }

  Id id = Isar.autoIncrement;

  /// [Track]'s [path]
  @Index(
    unique: true,
    replace: false,
  )
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

  /// [folder] in which the track is located
  IsarLink<Folder> folder = IsarLink<Folder>();

  /// [genre] of the track
  IsarLink<Genre> genre = IsarLink<Genre>();

  /// [album] of the track
  IsarLink<Album> album = IsarLink<Album>();

  /// [year] of publication
  IsarLink<Year> year = IsarLink<Year>();

  @override
  String toString() => '''
      -Folder_${folder.value?.id}_--${folder.value?.name}------
      title: \t\t\t$title
      Album: \t\t\t${album.value?.name}
      AlbumArtist: \t${albumArtist.value?.name ?? '<UNKNOWN>'}
      Artist: \t\t${artist.value?.name ?? '<UNKNOWN>'}
      Genre: \t\t\t${genre.value?.genre ?? '<UNKNOWN>'}
      ----------''';
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
