import 'package:flutter/material.dart';

import '../../../../../domain/audio_library/model.folder.dart';
import '../../../../../infrastructure/utils/app.sizes.dart';
import 'widget.folder_item.dart';

class FoldersList extends StatelessWidget {
  const FoldersList({
    required this.folders,
    super.key,
  });

  final List<Folder> folders;

  @override
  Widget build(final BuildContext context) => ListView.builder(
        shrinkWrap: true,
        primary: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (final context, final index) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.points_0,
            vertical: AppSizes.points_4,
          ),
          child: FolderItem(
            folder: folders[index],
          ),
        ),
        itemCount: folders.length,
      );
}
