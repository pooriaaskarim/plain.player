import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';

import '../../domain/audio_library/model.folder.dart';
import '../../domain/audio_library/model.genre.dart';
import '../../domain/audio_library/model.track.dart';
import '../../infrastructure/repositories/repository.audio.dart';
import 'state.folders.dart';

class FoldersCubit extends Cubit<FoldersState> {
  FoldersCubit({required final AudioRepository audioRepository})
      : _audioRepository = audioRepository,
        super(FoldersState.readingFolders());

  final AudioRepository _audioRepository;

  bool isLoadingFolders = false;

  Future<List<Track>> readTracks() => _audioRepository.getTracks();
  Future<List<Genre>> readGenres() => _audioRepository.getGenres();

  Future<int?> addFolder() async {
    final String? folderPath = await FilePicker.platform.getDirectoryPath();
    return (folderPath != null)
        ? _audioRepository.addFolder(Folder(path: folderPath))
        : null;
  }

  Future<bool> deleteFolder(final Folder folder) async =>
      _audioRepository.deleteFolder(folder);
  Future<List<Folder>> getFolders() async {
    emit(FoldersState.readingFolders(isLoading: true));
    final folders = _audioRepository.getFolders();
    emit(FoldersState.readingFolders(isLoading: false));
    return folders;
  }
}
