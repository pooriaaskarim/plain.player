part of 'state.audio_library.dart';

class ErrorState extends AudioLibraryState {
  const ErrorState._({
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
