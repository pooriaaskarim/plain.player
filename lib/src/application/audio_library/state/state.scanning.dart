part of 'state.audio_library.dart';

class ScanningState extends AudioLibraryState {
  const ScanningState._({
    required super.folders,
    required this.scanningStatus,
    super.artists,
    super.genres,
    super.isLoadingArtists = false,
    super.isLoadingFolders = false,
    super.isLoadingGenres = false,
    super.isLoadingTracks = false,
    super.isScanning = true,
  });

  final Stream<String> scanningStatus;
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
        scanningStatus,
      ];
}
