import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/audio_library/cubit.audio_library.dart';
import '../../../../application/audio_library/state/state.audio_library.dart';
import '../../../../application/plain/bloc.plain.dart';
import '../../../../domain/audio_library/model.folder.dart';
import '../../../shared/widgets/widget.loading.dart';
import '../i.plain.tab.dart';
import 'widgets/widget.folders_list.dart';

class FoldersTab extends StatefulWidget implements PlainTab {
  const FoldersTab({super.key});

  @override
  State<FoldersTab> createState() => _FoldersTabState();
  @override
  Widget? floatingActionButton(final BuildContext context) {
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
      builder: (final context, final state) => state.folders.isEmpty
          ? FloatingActionButton.extended(
              onPressed: onPressed,
              label: const Text('Add a Folder'),
              icon: const Icon(Icons.add),
            )
          : FloatingActionButton(
              onPressed: onPressed,
              child: const Icon(Icons.add),
            ),
    );
  }
}

class _FoldersTabState extends State<FoldersTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(final BuildContext context) {
    super.build(context);
    BlocProvider.of<PlainBloc>(context).audioLibraryHandler.loadFolders();

    return BlocBuilder<AudioLibraryCubit, AudioLibraryState>(
      builder: (final context, final state) {
        final List<Folder> folders = state.folders;
        final bool isLoadingFolders = state.isLoadingFolders;

        return Scaffold(
          appBar: AppBar(
            title: Text('${folders.length} Folders'),
          ),
          body: WillPopScope(
            onWillPop: () async {
              BlocProvider.of<PlainBloc>(context).tabController.animateTo(0);
              return false;
            },
            child: isLoadingFolders
                ? Center(
                    child:
                        Loading(color: Theme.of(context).colorScheme.primary),
                  )
                : (folders.isNotEmpty)
                    ? FoldersList(
                        folders: folders,
                      )
                    : const Center(child: Text('No folders added')),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
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
