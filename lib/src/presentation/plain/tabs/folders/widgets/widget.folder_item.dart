import 'package:flutter/material.dart';

import '../../../../../domain/audio_library/model.folder.dart';
import '../../../../../infrastructure/utils/app.sizes.dart';
import '../../../../shared/widgets/widget.scrolling_text.dart';
import 'dialog.delete_folder.dart';

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
      onPressed: () {
        showDialog(
          context: context,
          builder: (final context) => ShowFolderDialog(folder: folder),
        );
      },
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
          Icon(
            Icons.folder,
            opticalSize: AppSizes.points_32,
            size: AppSizes.points_32,
            color: Theme.of(context).colorScheme.tertiary,
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
                      text: folder.path.split('/').last,
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
            visualDensity: VisualDensity.compact,
            onPressed: () {
              showDialog(
                context: context,
                builder: (final context) => DeleteFolderDialog(folder: folder),
              );
            },
            icon: const Icon(
              Icons.clear,
              size: AppSizes.points_24,
            ),
          ),
        ],
      ),
    );
  }
}

class ShowFolderDialog extends StatelessWidget {
  const ShowFolderDialog({
    required this.folder,
    super.key,
  });

  final Folder folder;

  @override
  Widget build(final BuildContext context) => Dialog.fullscreen(
        child: Scaffold(
          appBar: AppBar(
            title: ScrollingText(
              text: folder.path.split('/').last,
              textStyle: Theme.of(context).appBarTheme.titleTextStyle!,
              size: MediaQuery.of(context).size,
            ),
          ),
          body: ListView.builder(
            shrinkWrap: true,
            itemCount: folder.directory.listSync().length,
            itemBuilder: (final context, final index) => OutlinedButton(
              onPressed: null,
              child: Text(
                folder.directory.listSync()[index].path.split('/').last,
              ),
            ),
          ),
        ),
      );
}
