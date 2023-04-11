import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/audio_library/cubit.audio_library.dart';
import '../../../../application/audio_library/state/state.audio_library.dart';
import '../../../../application/plain/bloc.plain.dart';
import '../../../../domain/audio_library/model.folder.dart';
import '../../../shared/widgets/widget.loading.dart';
import '../../screen.plain.dart';
import '../i.plain.tab.dart';
import 'widgets/widget.folder_content_list.dart';
import 'widgets/widget.folders_list.dart';

class FoldersTab extends PlainTab {
  const FoldersTab({
    required super.key,
  });
  static FoldersTabState of(final BuildContext context) {
    assert(context != null);
    assert(context.findAncestorWidgetOfExactType<FoldersTab>() != null);

    final FoldersTabData data =
        context.dependOnInheritedWidgetOfExactType<FoldersTabData>()!;
    return data.state;
  }

  @override
  PlainTabState<FoldersTab> createState() => FoldersTabState();
}

class FoldersTabState extends PlainTabState<FoldersTab> {
  bool showFAB = true;
  final Duration _dismissFABAnimationDuration =
      const Duration(milliseconds: 300);
  final GlobalKey<FolderContentListState> _foldersContentListKey =
      GlobalKey<FolderContentListState>();
  Folder? currentFolder;
  String? get contentTitle => currentFolder?.path.split('/').last;
  String get appBarTitle => contentTitle ?? 'Folders';
  PlainScreenState? parentState;
  @override
  void initState() {
    BlocProvider.of<PlainBloc>(context).audioLibraryHandler.loadFolders();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    parentState = PlainScreen.of(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(final BuildContext context) {
    super.build(context);

    return BlocBuilder<AudioLibraryCubit, AudioLibraryState>(
      builder: (final _, final state) {
        final List<Folder> folders = state.folders;
        final bool isLoadingFolders = state.isLoadingFolders;
        return NotificationListener<UserScrollNotification>(
          onNotification: (final notification) {
            _dismissFABOnFoldersListScroll(notification);
            return true;
          },
          child: isLoadingFolders
              ? Center(
                  child: Loading(color: Theme.of(context).colorScheme.primary),
                )
              : (folders.isNotEmpty)
                  ? FoldersTabData(
                      state: this,
                      child: (currentFolder != null)
                          ? FolderContentList(
                              key: _foldersContentListKey,
                              folder: currentFolder!,
                            )
                          : FoldersList(
                              folders: folders,
                            ),
                    )
                  : const Center(child: Text('No folders added')),
        );
      },
    );
  }

  void _dismissFABOnFoldersListScroll(
      final UserScrollNotification notification) {
    if (currentFolder == null) {
      final ScrollDirection direction = notification.direction;

      if (direction == ScrollDirection.reverse) {
        showFAB = false;
      } else if (direction == ScrollDirection.forward) {
        showFAB = true;
      } else if (direction == ScrollDirection.idle) {
        setState(() {});
        parentState?.setState(() {});
      }
    }
  }

  @override
  Widget? get floatingActionButton {
    Future<void> onPressed() async {
      await BlocProvider.of<PlainBloc>(context)
          .audioLibraryHandler
          .addFolder()
          .then((final value) {
        if (value != null) {
          BlocProvider.of<PlainBloc>(context).audioLibraryHandler.loadFolders();
        }
      });
    }

    return BlocBuilder<AudioLibraryCubit, AudioLibraryState>(
      builder: (final _, final state) => AnimatedSlide(
        duration: _dismissFABAnimationDuration,
        offset: showFAB ? Offset.zero : const Offset(0, 1),
        child: AnimatedOpacity(
          duration: _dismissFABAnimationDuration,
          opacity: showFAB ? 1 : 0,
          child: state.folders.isEmpty
              ? FloatingActionButton.extended(
                  onPressed: onPressed,
                  label: const Text('Add a Folder'),
                  icon: const Icon(Icons.add),
                )
              : FloatingActionButton(
                  onPressed: onPressed,
                  child: const Icon(Icons.add),
                ),
        ),
      ),
    );
  }

  @override
  AppBar? get appBar => AppBar(
        title: Text(appBarTitle),
      );

  @override
  Future<bool> get onWillPop async {
    if (currentFolder != null) {
      _foldersContentListKey.currentState!.handleDirectory(
        _foldersContentListKey.currentState!.currentDirectory.parent,
      );
    } else {
      PlainScreen.of(context).tabController.animateTo(0);
    }
    return false;
  }

  @override
  bool get wantKeepAlive => true;
}

class FoldersTabData extends InheritedWidget {
  const FoldersTabData({
    required super.child,
    required this.state,
    super.key,
  });

  final FoldersTabState state;

  @override
  bool updateShouldNotify(covariant final InheritedWidget oldWidget) => false;
}
// ElevatedButton(
// child: const Icon(Icons.add),
// onPressed: () async {
// final String? directory =
//     await FilePicker.platform.getDirectoryPath();
// if (directory != null) {
// await audioRepository.clear();
// await AppUtils.fakeDelay();
// Set<String> mimes = {};
// Set<String> mimesSup = {};
//
// await for (FileSystemEntity entity in Directory(directory)
//     .list(recursive: true, followLinks: false)) {
// // final FileSystemEntityType type =
// //     await FileSystemEntity.type(entity.path);
// mimes.add(lookupMimeType(entity.path) ?? '');
// if (FileSystemEntity.isFileSync(entity.path) &&
// entity.isSupportedAudio) {
// debugPrint('mime: ${lookupMimeType(entity.path)}');
// mimesSup.add(lookupMimeType(entity.path) ?? '');
// try {
// final tag =
// await audiotagger.readTags(path: entity.path);
// // debugPrint(tag?.genre ?? '');
// int x = await audioRepository.saveTrack(
// entity.path,
// tag,
// );
// debugPrint(x.toString());
// } catch (e) {
// debugPrint('''
//
//
//
//
//
//
//
//
//
//                           errrrrrrrrrrror:
//                           ${entity.uri}
//                           mime: ${lookupMimeType(entity.path)}
//                           $e
//
//
//
//
//                           ''');
// continue;
// }
// } else {
// debugPrint(
// 'nooo: ${entity.uri}, mime: ${lookupMimeType(entity.path)}',
// );
// }
// }
// debugPrint(mimes.toString());
// debugPrint(mimesSup.toString());
// }
// },
// )
// ],
