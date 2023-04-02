import 'package:audiotagger/audiotagger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/folders/cubit.folders.dart';
import '../../../../application/folders/state.folders.dart';
import '../../../../domain/audio_library/model.folder.dart';
import '../../../../infrastructure/repositories/repository.audio.dart';
import '../../../../infrastructure/utils/app.utils.dart';
import '../../../shared/widgets/widget.scrolling_text.dart';
import '../plain.tab.i.dart';

class FoldersTab extends StatelessWidget implements PlainTab {
  FoldersTab({super.key});

  final Set<String> genreSet = {};
  final Audiotagger audiotagger = Audiotagger();

  @override
  Widget build(final BuildContext context) => BlocProvider(
        create: (final _) => FoldersCubit(
          audioRepository: RepositoryProvider.of<AudioRepository>(context),
        ),
        child: BlocBuilder<FoldersCubit, FoldersState>(
          builder: (final context, final state) => FutureBuilder<List<Folder>>(
            future: BlocProvider.of<FoldersCubit>(context).getFolders(),
            initialData: const [],
            builder: (final context, final foldersListSnapshot) =>
                ListView.builder(
              shrinkWrap: true,
              itemBuilder: (final context, final index) {
                final TextStyle? textStyle =
                    Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        );
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppUtils.size_4Pt,
                    vertical: AppUtils.size_4Pt,
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
                                    AppUtils.size_4Pt,
                                  ),
                                  child: ScrollingText(
                                    text: foldersListSnapshot.data![index].path
                                        .split('/')
                                        .last,
                                    textStyle: textStyle!,
                                    size: Size(
                                      constraints.maxWidth,
                                      constraints.maxHeight,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(
                                    AppUtils.size_4Pt,
                                  ),
                                  child: ScrollingText(
                                    text: foldersListSnapshot
                                        .data![index].directory.absolute.path
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
                          onPressed: () => BlocProvider.of<FoldersCubit>(
                            context,
                          ).deleteFolder(
                            foldersListSnapshot.data![index],
                          ),
                          icon: const Icon(
                            Icons.delete,
                            size: AppUtils.size_24Pt,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: foldersListSnapshot.data?.length,
            ),
          ),
        ),
      );

  @override
  FloatingActionButton? floatingActionButton(final BuildContext context) =>
      FloatingActionButton(
        onPressed: () async {
          await BlocProvider.of<FoldersCubit>(context).addFolder();
        },
        child: const Icon(Icons.add),
      );
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
