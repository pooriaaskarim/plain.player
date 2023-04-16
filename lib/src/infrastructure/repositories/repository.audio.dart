import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../../domain/audio_library/model.album.dart';
import '../../domain/audio_library/model.album_artist.dart';
import '../../domain/audio_library/model.artist.dart';
import '../../domain/audio_library/model.folder.dart';
import '../../domain/audio_library/model.genre.dart';
import '../../domain/audio_library/model.track.dart';
import '../../domain/audio_library/model.year.dart';
import '../exceptions/exceptions.storage.dart';
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

  ///Save a [Track] and saves it's IsarLink objects
  /// can log [Track] details to console
  /// returns [Track.id]
  Future<int> saveTrack(
    final Track track, {
    final bool log = false,
  }) async {
    final Isar db = await openDb;
    if (log) {
      debugPrint('''
      --ID-${track.id}-------
      $track
      Folder:
      ${track.folder.value?.id}
      ${track.folder.value?.name}
      -----------------------
      ''');
    }

    return _saveTrack(db, track);
  }

  Future<int> _saveTrack(final Isar db, final Track track) =>
      db.writeTxn(() async {
        if (track.album.value != null) {
          await db.albums.putByName(track.album.value!);
        }
        if (track.albumArtist.value != null) {
          await db.albumArtists.putByName(track.albumArtist.value!);
        }
        if (track.artist.value != null) {
          await db.artists.putByName(track.artist.value!);
        }
        if (track.genre.value != null) {
          await db.genres.putByGenre(track.genre.value!);
        }

        if (track.year.value != null) {
          await db.years.putByYear(track.year.value!);
        }
        if (track.folder.value != null) {
          await db.folders.putByPath(track.folder.value!);
        }

        final int trackID = await db.tracks.putByPath(track);

        await track.album.save();
        await track.albumArtist.save();
        await track.artist.save();
        await track.genre.save();
        await track.year.save();
        await track.folder.save();

        return trackID;
      });

  /// logs [Track]s from start (defaults to first from DB)
  /// to end (defaults to last from DB) into console
  Future<void> logTracks([final int? start, final int? end]) async {
    final Isar db = await openDb;
    final tracks = await db.tracks.where().findAll();
    debugPrint(
      (tracks.isEmpty)
          ? 'No Tracks Found!'
          : 'printing a total of ${tracks.length} tracks',
    );
    int count = 0;
    for (final track in tracks.getRange(start ?? 0, end ?? tracks.length)) {
      count++;
      debugPrint('''
--ID-${track.id}-------
$track
--$count-out-of-${tracks.length}------
      ''');
    }
  }

  /// Logs all tracks in the folder
  void logFolder(final Folder folder) {
    int count = 0;
    final tracks = folder.tracks.toList();
    debugPrint('--${folder.id}--${folder.name}--');
    for (final track in tracks) {
      count++;
      debugPrint('''
--ID-${track.id}-------
$track
--$count-out-of-${tracks.length}------ 
         ''');
    }
  }

  /// logs [Genre]s from start (defaults to first from DB)
  /// to end (defaults to last from DB) into console
  Future<void> logGenres([final int? start, final int? end]) async {
    final Isar db = await openDb;
    final genres = await db.genres.where().findAll();
    debugPrint(
      (genres.isEmpty)
          ? 'No Genres Found!'
          : 'printing a total of ${genres.length} genres',
    );
    for (final genre in genres.getRange(start ?? 0, end ?? genres.length)) {
      debugPrint('--ID-${genre.id}--$genre--------');
    }
  }

  /// logs [Album]s from start (defaults to first from DB)
  /// to end (defaults to last from DB) into console
  Future<void> logAlbums([final int? start, final int? end]) async {
    final Isar db = await openDb;
    final albums = await db.albums.where().findAll();
    debugPrint(
      (albums.isEmpty)
          ? 'No Albums Found!'
          : 'printing a total of ${albums.length} albums',
    );
    for (final album in albums.getRange(start ?? 0, end ?? albums.length)) {
      debugPrint('--ID-${album.id}--$album--------');
    }
  }

  /// logs [AlbumArtist]s from start (defaults to first from DB)
  /// to end (defaults to last from DB) into console
  Future<void> logAlbumArtists([final int? start, final int? end]) async {
    final Isar db = await openDb;
    final albumArtists = await db.albumArtists.where().findAll();
    debugPrint(
      (albumArtists.isEmpty)
          ? 'No AlbumArtists Found!'
          : 'printing a total of ${albumArtists.length} albumArtists',
    );
    for (final albumArtist
        in albumArtists.getRange(start ?? 0, end ?? albumArtists.length)) {
      debugPrint('--ID-${albumArtist.id}--$albumArtist--------');
    }
  }

  /// logs [Artist]s from start (defaults to first from DB)
  /// to end (defaults to last from DB) into console
  Future<void> logArtists([final int? start, final int? end]) async {
    final Isar db = await openDb;
    final artists = await db.artists.where().findAll();
    debugPrint(
      (artists.isEmpty)
          ? 'No Artists Found!'
          : 'printing a total of ${artists.length} artists',
    );
    for (final artist in artists.getRange(start ?? 0, end ?? artists.length)) {
      debugPrint('--ID-${artist.id}--$artist--------');
    }
  }

  /// logs [Year]s from start (defaults to first from DB)
  /// to end (defaults to last from DB) into console
  Future<void> logYears([final int? start, final int? end]) async {
    final Isar db = await openDb;
    final years = await db.years.where().findAll();
    debugPrint(
      (years.isEmpty)
          ? 'No Years Found!'
          : 'printing a total of ${years.length} years',
    );
    for (final year in years.getRange(start ?? 0, end ?? years.length)) {
      debugPrint('--ID-${year.id}--$year--------');
    }
  }

  Future<void> logDB() async {
    await logTracks();
    await logGenres();
    await logAlbums();
    await logAlbumArtists();
    await logArtists();
    await logYears();
  }

  ///Clean up [Album]s, [AlbumArtist]s, [Artist]s,
  /// [Genre]s & [Year]s with no [Track]s
  Future<void> cleanUpDB() async {
    final Isar db = await openDb;
    // await db.writeTxn<void>(
    //   () => db.tracks.where().filter().folderIsNull().deleteAll(),
    // );
    await db.writeTxn<void>(
      () => db.albums.where().filter().tracksIsEmpty().deleteAll(),
    );
    await db.writeTxn<void>(
      () => db.artists.where().filter().tracksIsEmpty().deleteAll(),
    );
    await db.writeTxn<void>(
      () => db.albumArtists.where().filter().tracksIsEmpty().deleteAll(),
    );
    await db.writeTxn<void>(
      () => db.genres.where().filter().tracksIsEmpty().deleteAll(),
    );
    await db.writeTxn<void>(
      () => db.years.where().filter().tracksIsEmpty().deleteAll(),
    );
  }

  ///Add a [Folder] to Audio Library
  Future<int> addFolder(final Folder folder) async {
    final Isar db = await openDb;
    final List<Folder> savedFolders = await getFolders();
    final List<Folder> subDirectories = [];
    for (final savedFolder in savedFolders) {
      if (savedFolder.path == folder.path) {
        throw FolderAlreadyExistsException(folder: folder);
      }
      if (folder.path.startsWith(savedFolder.path)) {
        throw FolderIsSubDirectoryOfException(
          folder: folder,
          parent: savedFolder,
        );
      }
      if (savedFolder.path.startsWith(folder.path)) {
        subDirectories.add(savedFolder);
      }
    }

    if (subDirectories.isNotEmpty) {
      debugPrint('FromRepo: $subDirectories');
      throw FolderHasSubDirectoriesException(
        folder: folder,
        subDirectories: subDirectories,
      );
    }

    return db.writeTxn<int>(() => db.folders.putByPath(folder));
  }

  ///Remove all [Track]s from the [Folder]
  Future<int> clearFolder(final Folder folder) async {
    final Isar db = await openDb;

    final int count = await db.writeTxn(
      () async => db.tracks
          .where()
          .filter()
          .folder((final q) => q.idEqualTo(folder.id))
          .deleteAll(),
    );
    folder.tracks.clear();
    await folder.tracks.save();
    return count;
  }

  ///Remove the folder
  Future<bool> deleteFolder(final Folder folder) async {
    final Isar db = await openDb;
    return db.writeTxn(() => db.folders.delete(folder.id));
  }

  Future<int> saveFolder(final Folder folder) async {
    final Isar db = await openDb;
    // await folder.tracks.save();
    return db.writeTxn(() => db.folders.putByPath(folder));
  }

  // Future<int> deleteAllFolders(final List<Folder> folders) async {
  //   final Isar db = await openDb;
  //   final List<int> folderIDs = [];
  //   final List<int> trackIDs = [];
  //
  //   for (final folder in folders) {
  //     folderIDs.add(folder.id);
  //     await folder.tracks.load();
  //
  //     trackIDs.addAll(folder.tracks.map((final e) => e.id).toList());
  //   }
  //   debugPrint(folderIDs.toString());
  //   debugPrint(trackIDs.toString());
  //   await db.writeTxn(() => db.tracks.deleteAll(trackIDs));
  //   return db.writeTxn(() => db.folders.deleteAll(folderIDs));
  // }

  ///Return all [Folder]s in the database
  Future<List<Folder>> getFolders() async {
    final Isar db = await openDb;
    return db.folders.where().findAll();
  }

  ///Return all [Artist]s in the database
  Future<List<Artist>> getArtists() async {
    final Isar db = await openDb;
    return db.artists.where().findAll();
  }

  ///Return all [Genre]s in the database
  Future<List<Genre>> getGenres() async {
    final Isar db = await openDb;
    return db.genres.where().findAll();
  }

  ///Return all [Track]s in the database
  Future<List<Track>> getTracks() async {
    final Isar db = await openDb;
    return db.tracks.where().findAll();
  }

  ///Drop all the data in the database
  Future<void> clear() async {
    final Isar db = await openDb;
    return db.writeTxn<void>(() => db.clear());
  }
}
