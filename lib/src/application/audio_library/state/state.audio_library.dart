import 'package:equatable/equatable.dart';

import '../../../domain/audio_library/model.artist.dart';
import '../../../domain/audio_library/model.folder.dart';
import '../../../domain/audio_library/model.genre.dart';

part 'state.default.dart';
part 'state.error.dart';
part 'state.loading.dart';

abstract class AudioLibraryState extends Equatable {
  const AudioLibraryState({
    required this.folders,
    this.artists,
    this.genres,
    this.isLoadingArtists = false,
    this.isLoadingFolders = false,
    this.isLoadingGenres = false,
    this.isLoadingTracks = false,
    this.isScanning = true,
  });

  factory AudioLibraryState.defaultState({
    required final List<Folder> folders,
    final List<Artist>? artists,
    final List<Genre>? genres,
    final bool isLoadingGenres = false,
    final bool isLoadingFolders = false,
    final bool isLoadingArtists = false,
    final bool isLoadingTracks = false,
    final bool isScanning = false,
  }) =>
      DefaultState._(
        folders: folders,
        genres: genres,
        artists: artists,
        isLoadingArtists: isLoadingArtists,
        isLoadingFolders: isLoadingFolders,
        isLoadingGenres: isLoadingGenres,
        isLoadingTracks: isLoadingTracks,
        isScanning: isScanning,
      );
  factory AudioLibraryState.loading({
    required final List<Folder> folders,
    final List<Artist>? artists,
    final List<Genre>? genres,
    final bool isLoadingGenres = false,
    final bool isLoadingFolders = false,
    final bool isLoadingArtists = false,
    final bool isLoadingTracks = false,
    final bool isScanning = false,
  }) =>
      LoadingState._(
        folders: folders,
        genres: genres,
        artists: artists,
        isLoadingArtists: isLoadingArtists,
        isLoadingFolders: isLoadingFolders,
        isLoadingGenres: isLoadingGenres,
        isLoadingTracks: isLoadingTracks,
        isScanning: isScanning,
      );
  factory AudioLibraryState.error({
    required final List<Folder> folders,
    final List<Artist>? artists,
    final List<Genre>? genres,
    final bool isLoadingGenres = false,
    final bool isLoadingFolders = false,
    final bool isLoadingArtists = false,
    final bool isLoadingTracks = false,
    final bool isScanning = false,
  }) =>
      ErrorState._(
        folders: folders,
        genres: genres,
        artists: artists,
        isLoadingArtists: isLoadingArtists,
        isLoadingFolders: isLoadingFolders,
        isLoadingGenres: isLoadingGenres,
        isLoadingTracks: isLoadingTracks,
        isScanning: isScanning,
      );

  final List<Artist>? artists;
  final List<Folder> folders;
  final List<Genre>? genres;
  final bool isLoadingGenres;
  final bool isLoadingFolders;
  final bool isLoadingArtists;
  final bool isLoadingTracks;
  final bool isScanning;
  @override
  List<Object?> get props => [
        artists,
        folders,
        genres,
        isLoadingArtists,
        isLoadingFolders,
        isLoadingGenres,
        isLoadingTracks,
        isScanning,
      ];
}
