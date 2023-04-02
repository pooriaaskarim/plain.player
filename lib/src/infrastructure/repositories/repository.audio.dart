import 'package:audiotagger/models/tag.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../../domain/audio_library/model.album.dart';
import '../../domain/audio_library/model.album_artist.dart';
import '../../domain/audio_library/model.artist.dart';
import '../../domain/audio_library/model.folder.dart';
import '../../domain/audio_library/model.genre.dart';
import '../../domain/audio_library/model.track.dart';
import '../../domain/audio_library/model.year.dart';
import 'i.repository.local.dart';

class AudioRepository implements LocalRepository {
  const AudioRepository();
  @override
  @protected
  bool get isOpen => Isar.instanceNames.contains(instanceName);
  @override
  @protected
  final String instanceName = 'AudioRepository';
  @override
  @protected
  final List<CollectionSchema> schemasList = const [
    AlbumSchema,
    AlbumArtistSchema,
    ArtistSchema,
    GenreSchema,
    TrackSchema,
    YearSchema,
    FolderSchema,
  ];

  @override
  @protected
  Future<Isar> get openDb async => isOpen
      ? Future.value(Isar.getInstance(instanceName))
      : Isar.open(
          [...schemasList],
          name: instanceName,
          inspector: true,
        );

  @override
  Future<void> get dismissDb async {
    if (isOpen) {
      await (await openDb).close();
    }
  }

  Future<int> saveTrack(final String path, final Tag? tag) async {
    final Isar db = await openDb;
    final Track track =
        (tag == null) ? Track(path: path) : Track.fromTag(path: path, tag: tag);

    return db.writeTxn<int>(() {
      final Future<int> trackId = db.tracks.put(track);
      if (track.genre.value != null) {
        db.genres.putByGenre(track.genre.value!);
        track.genre.save;
      }
      return trackId;
    });
  }

  Future<int> addFolder(final Folder folder) async {
    final Isar db = await openDb;
    return db.writeTxn(() => db.folders.putByPath(folder));
  }

  Future<bool> deleteFolder(final Folder folder) async {
    final Isar db = await openDb;
    return db.writeTxn(() => db.folders.delete(folder.id));
  }

  Future<List<Folder>> getFolders() async {
    final Isar db = await openDb;
    return db.folders.where().findAll();
  }

  Future<List<Genre>> getGenres() async {
    final Isar db = await openDb;
    return db.genres.where().findAll();
  }

  Future<List<Track>> getTracks() async {
    final Isar db = await openDb;
    return db.tracks.where().findAll();
  }

  Future<void> clear() async {
    final Isar db = await openDb;
    return db.writeTxn<void>(() => db.clear());
  }
}
