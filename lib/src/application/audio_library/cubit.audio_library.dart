import 'dart:async';
import 'dart:io';

import 'package:audiotagger/audiotagger.dart';
import 'package:audiotagger/models/tag.dart';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';

import '../../domain/audio_library/model.album.dart';
import '../../domain/audio_library/model.artist.dart';
import '../../domain/audio_library/model.folder.dart';
import '../../domain/audio_library/model.genre.dart';
import '../../domain/audio_library/model.track.dart';
import '../../infrastructure/repositories/repository.audio.dart';
import '../../infrastructure/utils/extensions/extension.filesystem_entity.is_audio.dart';
import 'state/state.audio_library.dart';

class AudioLibraryCubit extends Cubit<AudioLibraryState> {
  AudioLibraryCubit({required final AudioRepository audioRepository})
      : _audioRepository = audioRepository,
        super(AudioLibraryState.defaultState(folders: const []));

  final AudioRepository _audioRepository;
  final Audiotagger audiotagger = Audiotagger();

  void logFolder(final Folder folder) {
    _audioRepository.logFolder(folder);
  }

  void logDB() {
    _audioRepository.logDB();
  }

  Future<void> clear() async {
    await _audioRepository.clear();
    await loadFolders();
  }

  Future<void> clearFolder(final Folder folder) async {
    await _audioRepository.clearFolder(folder);
    await _audioRepository.cleanUpDB();
  }

  Future<void> scanFolder(final Folder folder) async {
    final StreamController<String> scanningStatus = StreamController<String>()
      ..add('Reading Folder...');
    emit(
      AudioLibraryState.scanning(
        scanningStatus: scanningStatus.stream,
        isScanning: true,
        albums: state.albums,
        artists: state.artists,
        folders: state.folders,
        genres: state.genres,
      ),
    );
    final List<FileSystemEntity> audioFilesInFolder =
        await _getSupportedAudioList(folder);
    if (!state.isScanning) {
      emit(
        AudioLibraryState.defaultState(
          albums: state.albums,
          artists: state.artists,
          folders: state.folders,
          genres: state.genres,
        ),
      );
      return;
    }

    scanningStatus.add('Preparing to index...');
    await _audioRepository.clearFolder(folder);
    await _audioRepository.cleanUpDB();

    int scannedItems = 0;
    final int totalItems = audioFilesInFolder.length;

    for (final FileSystemEntity entity in audioFilesInFolder) {
      if (!state.isScanning) {
        emit(
          AudioLibraryState.defaultState(
            albums: state.albums,
            artists: state.artists,
            folders: state.folders,
            genres: state.genres,
          ),
        );

        break;
      }

      Tag? tag;
      try {
        tag = await audiotagger.readTags(path: entity.path);
      } catch (e) {
        debugPrint('''

                          errrrrrrrrrrror:
                          ${entity.uri}
                        mime: ${lookupMimeType(entity.path)}
                        $e
    
                 ''');
      }
      scannedItems++;
      final Track track = (tag == null)
          ? (Track(path: entity.path)..folder.value = folder)
          : Track.fromTag(
              path: entity.path,
              tag: tag,
            )
        ..folder.value = folder;
      await _audioRepository.saveTrack(track, log: true);
      folder.tracks.add(track);
      scanningStatus.add('$scannedItems scanned out of $totalItems\n');
    }
    await _audioRepository
        .saveFolder(folder..isScanned = scannedItems == totalItems);
    emit(
      AudioLibraryState.defaultState(
        albums: state.albums,
        artists: state.artists,
        folders: state.folders,
        genres: state.genres,
      ),
    );
    debugPrint('''
---Folder----${folder.id}---- 
      name: ${folder.name}
      isScanned: ${folder.isScanned}
      totalTracks: ${folder.totalTracks}''');

    await scanningStatus.close();
  }

  Future<List<FileSystemEntity>> _getSupportedAudioList(
    final Folder folder,
  ) =>
      folder.directory
          .list(recursive: true, followLinks: false)
          .where((final entity) => entity.isSupportedAudio)
          .toList();

  Future<List<Track>> getTracks() async {
    emit(
      AudioLibraryState.loading(
        isLoadingTracks: true,
        albums: state.albums,
        artists: state.artists,
        folders: state.folders,
        genres: state.genres,
      ),
    );
    final List<Track> tracks = await _audioRepository.getTracks();
    AudioLibraryState.defaultState(
      albums: state.albums,
      artists: state.artists,
      folders: state.folders,
      genres: state.genres,
    );
    return tracks;
  }

  Future<void> loadAlbums() async {
    emit(
      AudioLibraryState.loading(
        isLoadingAlbums: true,
        albums: state.albums,
        artists: state.artists,
        folders: state.folders,
        genres: state.genres,
      ),
    );
    final List<Album> albums = await _audioRepository.getAlbums();
    emit(
      AudioLibraryState.defaultState(
        albums: albums,
        artists: state.artists,
        folders: state.folders,
        genres: state.genres,
      ),
    );
  }

  Future<void> loadArtists() async {
    emit(
      AudioLibraryState.loading(
        isLoadingArtists: true,
        albums: state.albums,
        artists: state.artists,
        folders: state.folders,
        genres: state.genres,
      ),
    );
    final List<Artist> artists = await _audioRepository.getArtists();
    emit(
      AudioLibraryState.defaultState(
        albums: state.albums,
        artists: artists,
        folders: state.folders,
        genres: state.genres,
      ),
    );
  }

  Future<void> loadGenres() async {
    emit(
      AudioLibraryState.loading(
        isLoadingGenres: true,
        albums: state.albums,
        artists: state.artists,
        folders: state.folders,
        genres: state.genres,
      ),
    );
    final List<Genre> genres = await _audioRepository.getGenres();
    emit(
      AudioLibraryState.defaultState(
        albums: state.albums,
        artists: state.artists,
        folders: state.folders,
        genres: genres,
      ),
    );
  }

  Future<int?> addFolder(final Folder folder) =>
      _audioRepository.addFolder(folder);

  Future<String?> chooseFolderFromFS() =>
      FilePicker.platform.getDirectoryPath();

  Future<bool> deleteFolder(final Folder folder) async {
    await _audioRepository.clearFolder(folder);
    final bool isDeleted = await _audioRepository.deleteFolder(folder);
    await _audioRepository.cleanUpDB();
    return isDeleted;
  }

  Future<int> deleteAllFolders(final List<Folder> folders) async {
    int count = 0;
    for (final folder in folders) {
      await _audioRepository.clearFolder(folder);
      await _audioRepository.deleteFolder(folder);
      count++;
    }
    await _audioRepository.cleanUpDB();
    debugPrint(count.toString());
    return count;
  }

  Future<void> loadFolders() async {
    emit(
      AudioLibraryState.loading(
        isLoadingFolders: true,
        albums: state.albums,
        artists: state.artists,
        folders: state.folders,
        genres: state.genres,
      ),
    );
    final List<Folder> folders = await _audioRepository.getFolders();
    emit(
      AudioLibraryState.defaultState(
        albums: state.albums,
        artists: state.artists,
        folders: folders,
        genres: state.genres,
      ),
    );
  }
}
