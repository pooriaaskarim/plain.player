import 'package:equatable/equatable.dart';

import '../../../domain/audio_library/model.album.dart';
import '../../../domain/audio_library/model.artist.dart';
import '../../../domain/audio_library/model.folder.dart';
import '../../../domain/audio_library/model.genre.dart';

part 'state.default.dart';
part 'state.error.dart';
part 'state.loading.dart';
part 'state.scanning.dart';

abstract class AudioLibraryState extends Equatable {
  const AudioLibraryState({
    required this.folders,
    this.artists,
    this.genres,
    this.albums,
    this.isLoadingAlbums = false,
    this.isLoadingArtists = false,
    this.isLoadingFolders = false,
    this.isLoadingGenres = false,
    this.isLoadingTracks = false,
    this.isScanning = false,
  });

  factory AudioLibraryState.defaultState({
    required final List<Folder> folders,
    final List<Album>? albums,
    final List<Artist>? artists,
    final List<Genre>? genres,
    final bool isLoadingAlbums = false,
    final bool isLoadingArtists = false,
    final bool isLoadingFolders = false,
    final bool isLoadingGenres = false,
    final bool isLoadingTracks = false,
    final bool isScanning = false,
  }) =>
      DefaultState._(
        folders: folders,
        albums: albums,
        artists: artists,
        genres: genres,
        isLoadingAlbums: isLoadingAlbums,
        isLoadingArtists: isLoadingArtists,
        isLoadingFolders: isLoadingFolders,
        isLoadingGenres: isLoadingGenres,
        isLoadingTracks: isLoadingTracks,
        isScanning: isScanning,
      );
  factory AudioLibraryState.loading({
    required final List<Folder> folders,
    final List<Album>? albums,
    final List<Artist>? artists,
    final List<Genre>? genres,
    final bool isLoadingAlbums = false,
    final bool isLoadingGenres = false,
    final bool isLoadingFolders = false,
    final bool isLoadingArtists = false,
    final bool isLoadingTracks = false,
    final bool isScanning = false,
  }) =>
      LoadingState._(
        folders: folders,
        albums: albums,
        artists: artists,
        genres: genres,
        isLoadingAlbums: isLoadingAlbums,
        isLoadingArtists: isLoadingArtists,
        isLoadingFolders: isLoadingFolders,
        isLoadingGenres: isLoadingGenres,
        isLoadingTracks: isLoadingTracks,
        isScanning: isScanning,
      );
  factory AudioLibraryState.scanning({
    required final List<Folder> folders,
    required final Stream<String> scanningStatus,
    final List<Album>? albums,
    final List<Artist>? artists,
    final List<Genre>? genres,
    final bool isLoadingAlbums = false,
    final bool isLoadingArtists = false,
    final bool isLoadingFolders = false,
    final bool isLoadingGenres = false,
    final bool isLoadingTracks = false,
    final bool isScanning = true,
  }) =>
      ScanningState._(
        folders: folders,
        scanningStatus: scanningStatus,
        albums: albums,
        artists: artists,
        genres: genres,
        isLoadingAlbums: isLoadingAlbums,
        isLoadingArtists: isLoadingArtists,
        isLoadingFolders: isLoadingFolders,
        isLoadingGenres: isLoadingGenres,
        isLoadingTracks: isLoadingTracks,
        isScanning: isScanning,
      );
  factory AudioLibraryState.error({
    required final List<Folder> folders,
    final List<Album>? albums,
    final List<Artist>? artists,
    final List<Genre>? genres,
    final bool isLoadingAlbums = false,
    final bool isLoadingArtists = false,
    final bool isLoadingFolders = false,
    final bool isLoadingGenres = false,
    final bool isLoadingTracks = false,
    final bool isScanning = false,
  }) =>
      ErrorState._(
        folders: folders,
        albums: albums,
        artists: artists,
        genres: genres,
        isLoadingAlbums: isLoadingAlbums,
        isLoadingArtists: isLoadingArtists,
        isLoadingFolders: isLoadingFolders,
        isLoadingGenres: isLoadingGenres,
        isLoadingTracks: isLoadingTracks,
        isScanning: isScanning,
      );

  final List<Artist>? artists;
  final List<Folder> folders;
  final List<Genre>? genres;
  final List<Album>? albums;
  final bool isLoadingAlbums;
  final bool isLoadingArtists;
  final bool isLoadingFolders;
  final bool isLoadingGenres;
  final bool isLoadingTracks;
  final bool isScanning;
  @override
  List<Object?> get props => [
        albums,
        artists,
        folders,
        genres,
        isLoadingAlbums,
        isLoadingArtists,
        isLoadingFolders,
        isLoadingGenres,
        isLoadingTracks,
        isScanning,
      ];
}
