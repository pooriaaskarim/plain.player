part of 'state.audio_library.dart';

class DefaultState extends AudioLibraryState {
  const DefaultState._({
    required super.folders,
    super.albums,
    super.artists,
    super.genres,
    super.isLoadingAlbums = false,
    super.isLoadingArtists = false,
    super.isLoadingFolders = false,
    super.isLoadingGenres = false,
    super.isLoadingTracks = false,
    super.isScanning = false,
  });
}
