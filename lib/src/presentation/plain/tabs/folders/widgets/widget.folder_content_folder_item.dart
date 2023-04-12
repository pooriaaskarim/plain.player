import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../infrastructure/utils/app.sizes.dart';
import '../../../../shared/widgets/widget.scrolling_text.dart';

class FolderContentFolderItem extends StatelessWidget {
  const FolderContentFolderItem({
    required this.directory,
    required this.currentDirectory,
    required this.onTap,
    super.key,
  });

  final FileSystemEntity directory;
  final FileSystemEntity currentDirectory;
  final void Function() onTap;

  @override
  Widget build(final BuildContext context) {
    final TextStyle? textStyle =
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onTertiaryContainer,
            );
    final Color iconColor =
        Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(.8);
    const double iconSize = AppSizes.points_32;

    final Color borderColor = Theme.of(context).colorScheme.tertiary;
    const double borderWidth = 1;
    const EdgeInsets itemPadding = EdgeInsets.all(
      AppSizes.points_4,
    );
    const IconData folderIcon = Icons.folder;
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const ContinuousRectangleBorder(),
        ),
        side: MaterialStateProperty.all(
          BorderSide(
            width: borderWidth,
            color: borderColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            folderIcon,
            size: iconSize,
            color: iconColor,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (final context, final constraints) {
                final String label =
                    (directory.path == currentDirectory.parent.path)
                        ? '../${currentDirectory.path.split('/').last}'
                        : directory.path.split('/').last;

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: itemPadding,
                      child: ScrollingText(
                        text: label,
                        textStyle: textStyle!,
                        maxLines: 2,
                        size: Size(
                          constraints.maxWidth,
                          constraints.maxHeight,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
