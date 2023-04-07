import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/audio_library/cubit.audio_library.dart';
import '../../../../application/audio_library/state/state.audio_library.dart';
import '../../../../application/plain/bloc.plain.dart';
import '../../../../domain/audio_library/model.folder.dart';
import '../../../../infrastructure/utils/app.sizes.dart';
import '../../../shared/widgets/widget.loading.dart';
import '../../../shared/widgets/widget.scrolling_text.dart';
import '../i.plain.tab.dart';

class FoldersTab extends StatefulWidget implements PlainTab {
  const FoldersTab({super.key});

  @override
  State<FoldersTab> createState() => _FoldersTabState();
  @override
  FloatingActionButton? floatingActionButton(final BuildContext context) =>
      BlocProvider.of<PlainBloc>(context)
              .audioLibraryHandler
              .state
              .folders
              .isEmpty
          ? FloatingActionButton.extended(
              onPressed: () async {
                await BlocProvider.of<PlainBloc>(context)
                    .audioLibraryHandler
                    .addFolder()
                    .then((final value) {
                  if (value != null) {
                    BlocProvider.of<PlainBloc>(context)
                        .audioLibraryHandler
                        .loadFolders();
                  }
                });
              },
              label: const Text('Add a Folder'),
              icon: const Icon(Icons.add),
            )
          : FloatingActionButton(
              onPressed: () async {
                await BlocProvider.of<PlainBloc>(context)
                    .audioLibraryHandler
                    .addFolder()
                    .then((final value) {
                  if (value != null) {
                    BlocProvider.of<PlainBloc>(context)
                        .audioLibraryHandler
                        .loadFolders();
                  }
                });
              },
              child: const Icon(Icons.add),
            );
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

        final TextStyle? textStyle =
            Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                );
        return isLoadingFolders
            ? Center(
                child: Loading(color: Theme.of(context).colorScheme.primary),
              )
            : (folders.isNotEmpty)
                ? ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (final context, final index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.points_4,
                        vertical: AppSizes.points_4,
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const ContinuousRectangleBorder(),
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: LayoutBuilder(
                                builder: (final context, final constraints) =>
                                    Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(
                                        AppSizes.points_4,
                                      ),
                                      child: ScrollingText(
                                        text:
                                            folders[index].path.split('/').last,
                                        textStyle: textStyle!,
                                        size: Size(
                                          constraints.maxWidth,
                                          constraints.maxHeight,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(
                                        AppSizes.points_4,
                                      ),
                                      child: ScrollingText(
                                        text: folders[index]
                                            .directory
                                            .absolute
                                            .path
                                            .replaceFirst('/', ''),
                                        textStyle: textStyle,
                                        size: Size(
                                          constraints.maxWidth,
                                          constraints.maxHeight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (final context) => AlertDialog(
                                    elevation: 1,
                                    title: const Text('Delete Folder'),
                                    icon: const Icon(Icons.dangerous),
                                    content:
                                        const Text('Are you sure you want to'
                                            ' delete this folder?'),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () =>
                                            BlocProvider.of<PlainBloc>(context)
                                                .audioLibraryHandler
                                                .deleteFolder(
                                                  folders[index],
                                                )
                                                .then((final value) {
                                          if (value) {
                                            BlocProvider.of<PlainBloc>(context)
                                                .audioLibraryHandler
                                                .loadFolders();
                                          }
                                          Navigator.of(context).pop();
                                        }),
                                        child: const Text('Yes'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text('No'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.delete,
                                size: AppSizes.points_24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemCount: folders.length,
                  )
                : const Center(child: Text('Add a Folder'));
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
