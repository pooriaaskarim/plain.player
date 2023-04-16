import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/audio_library/cubit.audio_library.dart';
import '../../../../application/audio_library/state/state.audio_library.dart';
import '../../../../domain/audio_library/model.folder.dart';
import '../../../../infrastructure/exceptions/exceptions.storage.dart';
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
    assert(
      context.findAncestorWidgetOfExactType<FoldersTab>() != null,
      'Could not find a FoldersTab Element in the context widget tree.',
    );

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
  Folder? openedFolder;
  String? get contentTitle => openedFolder?.path.split('/').last;
  String get appBarTitle => contentTitle ?? 'Folders';
  PlainScreenState? parentState;
  @override
  void initState() {
    BlocProvider.of<AudioLibraryCubit>(context).loadFolders();
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
                      child: (openedFolder != null)
                          ? FolderContentList(
                              key: _foldersContentListKey,
                              folder: openedFolder!,
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
    final UserScrollNotification notification,
  ) {
    if (openedFolder == null) {
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
      final audioLibraryCubit = BlocProvider.of<AudioLibraryCubit>(context);
      final scaffoldMessengerState = ScaffoldMessenger.of(context);
      int? folderID;
      final String? folderPath = await audioLibraryCubit.chooseFolder();
      if (folderPath == null) {
        return;
      } else {
        final Folder folder = Folder(path: folderPath);
        try {
          folderID = await audioLibraryCubit.addFolder(folder);
        } on StorageException catch (exception) {
          if (exception is FolderIsSubDirectoryOfException ||
              exception is FolderAlreadyExistsException) {
            scaffoldMessengerState.showSnackBar(
              SnackBar(
                content: Text(exception.message),
              ),
            );
          }
          if (exception is FolderHasSubDirectoriesException) {
            scaffoldMessengerState.showSnackBar(
              SnackBar(
                content: Text('${exception.message}'
                    '\nOmitting sub-Directories'
                    ' and replacing "${folderPath.split('/').last}"'),
              ),
            );
            await audioLibraryCubit.deleteAllFolders(exception.subDirectories);
            folderID = await audioLibraryCubit.addFolder(folder);
          }
        }
      }
      if (folderID != null) {
        await audioLibraryCubit.loadFolders();
      }
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
        actions: [
          TextButton(
            onPressed: () =>
                BlocProvider.of<AudioLibraryCubit>(context).clear(),
            child: const Text('Clear Db'),
          ),
          TextButton(
            onPressed: () =>
                BlocProvider.of<AudioLibraryCubit>(context).logDB(),
            child: const Text('Log Db'),
          ),
        ],
      );

  @override
  Future<bool> get onWillPop async {
    if (openedFolder != null) {
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
