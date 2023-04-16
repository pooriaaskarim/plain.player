import '../../domain/audio_library/model.folder.dart';
import 'exception.plain.dart';

abstract class StorageException<T> extends PlainException<T> {
  StorageException(super.message);

  @override
  String get type => 'Storage';
}

class FolderIsSubDirectoryOfException extends StorageException<String> {
  FolderIsSubDirectoryOfException({required this.folder, required this.parent})
      : super('"${folder.name}" is already included'
            ' as a sub-Directory of "${parent.name}":\n'
            '${parent.path} -> ${folder.path.split(parent.path).last}');

  final Folder folder;
  final Folder parent;
}

class FolderHasSubDirectoriesException extends StorageException<String> {
  FolderHasSubDirectoriesException({
    required this.folder,
    required this.subDirectories,
  })  : assert(subDirectories.isNotEmpty, 'Sub-Directories cannot be empty.'),
        super('"${folder.name}" has ${subDirectories.length} sub-Directory.');

  final Folder folder;
  final List<Folder> subDirectories;
}

class FolderAlreadyExistsException extends StorageException<String> {
  FolderAlreadyExistsException({required this.folder})
      : super('"${folder.name}" already exists.');

  final Folder folder;
}
