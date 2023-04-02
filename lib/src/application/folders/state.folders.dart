import 'package:equatable/equatable.dart';

abstract class FoldersState extends Equatable {
  const FoldersState._();
  factory FoldersState.readingFolders({final bool isLoading = false}) =>
      ReadingFolders._(isLoading: isLoading);
  factory FoldersState.selectingFolders() => const SelectFolders._();
  factory FoldersState.scanning() => const ScanFolders._();
  @override
  List<Object?> get props => [];
}

class ReadingFolders extends FoldersState {
  const ReadingFolders._({this.isLoading = false}) : super._();
  final bool isLoading;
}

class SelectFolders extends FoldersState {
  const SelectFolders._() : super._();
}

class ScanFolders extends FoldersState {
  const ScanFolders._() : super._();
}
