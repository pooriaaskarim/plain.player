import 'package:flutter/material.dart';

import '../../../../../domain/audio_library/model.folder.dart';
import '../../../../../infrastructure/utils/app.sizes.dart';
import '../../../../shared/widgets/widget.scrolling_text.dart';
import '../tab.folders.dart';
import 'dialog.Folder_on_long_press.dart';

class FolderItem extends StatelessWidget {
  const FolderItem({
    required this.folder,
    super.key,
  });

  final Folder folder;
  @override
  Widget build(final BuildContext context) {
    final TextStyle? textStyle =
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            );

    return ElevatedButton(
      onLongPress: () => FolderOnLongPressDialog(
        folder: folder,
      ).showDialog(context),
      onPressed: () {
        FoldersTab.of(context)
          ..openedFolder = folder
          ..showFAB = false
          ..setState(() {});
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const ContinuousRectangleBorder(),
        ),
        side: MaterialStateProperty.all(
          BorderSide(
            width: 1,
            color: Theme.of(context)
                .colorScheme
                .onTertiaryContainer
                .withOpacity(.8),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.folder,
            opticalSize: AppSizes.points_32,
            size: AppSizes.points_32,
            color: Theme.of(context)
                .colorScheme
                .onTertiaryContainer
                .withOpacity(.8),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (final context, final constraints) => Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      AppSizes.points_4,
                    ),
                    child: ScrollingText(
                      text: folderName,
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
                      text:
                          folder.directory.absolute.path.replaceFirst('/', ''),
                      textStyle: textStyle,
                      maxLines: 2,
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
        ],
      ),
    );
  }

  String get folderName => folder.path.split('/').last;
}
