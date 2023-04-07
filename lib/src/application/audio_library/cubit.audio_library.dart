import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';

import '../../domain/audio_library/model.artist.dart';
import '../../domain/audio_library/model.folder.dart';
import '../../domain/audio_library/model.genre.dart';
import '../../domain/audio_library/model.track.dart';
import '../../infrastructure/repositories/repository.audio.dart';
import 'state/state.audio_library.dart';

class AudioLibraryCubit extends Cubit<AudioLibraryState> {
  AudioLibraryCubit({required final AudioRepository audioRepository})
      : _audioRepository = audioRepository,
        super(AudioLibraryState.defaultState(folders: const []));

  final AudioRepository _audioRepository;

  Future<List<Track>> getTracks() async {
    emit(
      AudioLibraryState.loading(
        isLoadingTracks: true,
        folders: state.folders,
        artists: state.artists,
        genres: state.genres,
      ),
    );
    final List<Track> tracks = await _audioRepository.getTracks();
    AudioLibraryState.defaultState(
      folders: state.folders,
      artists: state.artists,
      genres: state.genres,
    );
    return tracks;
  }

  Future<void> loadGenres() async {
    emit(
      AudioLibraryState.loading(
        isLoadingGenres: true,
        folders: state.folders,
        artists: state.artists,
        genres: state.genres,
      ),
    );
    final List<Genre> genres = await _audioRepository.getGenres();
    emit(
      AudioLibraryState.defaultState(
        folders: state.folders,
        artists: state.artists,
        genres: genres,
      ),
    );
  }

  Future<void> loadArtists() async {
    emit(
      AudioLibraryState.loading(
        isLoadingArtists: true,
        folders: state.folders,
        artists: state.artists,
        genres: state.genres,
      ),
    );
    final List<Artist> artists = await _audioRepository.getArtists();
    emit(
      AudioLibraryState.defaultState(
        folders: state.folders,
        artists: artists,
        genres: state.genres,
      ),
    );
  }

  Future<int?> addFolder() async {
    final String? folderPath = await FilePicker.platform.getDirectoryPath();
    return (folderPath != null)
        ? await _audioRepository.addFolder(Folder(path: folderPath))
        : null;
  }

  Future<bool> deleteFolder(final Folder folder) async =>
      _audioRepository.deleteFolder(folder);
  Future<void> loadFolders() async {
    emit(
      AudioLibraryState.loading(
        isLoadingFolders: true,
        folders: state.folders,
        artists: state.artists,
        genres: state.genres,
      ),
    );
    final List<Folder> folders = await _audioRepository.getFolders();
    emit(
      AudioLibraryState.defaultState(
        folders: folders,
        artists: state.artists,
        genres: state.genres,
      ),
    );
  }
}
