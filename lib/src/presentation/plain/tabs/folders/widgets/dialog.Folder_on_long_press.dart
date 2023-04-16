import 'package:flutter/material.dart' as material;

import '../../../../../domain/audio_library/model.folder.dart';
import '../../../../../infrastructure/utils/app.sizes.dart';
import 'dialog.delete_folder.dart';
import 'dialog.scan_folder.dart';

class FolderOnLongPressDialog extends material.StatelessWidget {
  const FolderOnLongPressDialog({
    required this.folder,
    super.key,
  });
  final Folder folder;
  String get folderName => folder.path.split('/').last;
  Future<void> showDialog(final material.BuildContext context) =>
      material.showDialog(
        context: context,
        builder: (final _) => FolderOnLongPressDialog(
          folder: folder,
        ),
      );

  @override
  material.Widget build(final material.BuildContext context) => material.Dialog(
        child: material.ListView(
          scrollDirection: material.Axis.vertical,
          children: [
            material.ElevatedButton.icon(
              onPressed: () {
                material.Navigator.of(context).pop();
                DeleteFolderDialog(
                  folder: folder,
                ).showDialog(context);
              },
              label: material.Text('Delete "$folderName"'),
              icon: const material.Icon(
                material.Icons.delete,
                size: AppSizes.points_24,
              ),
            ),
            material.ElevatedButton.icon(
              onPressed: () async {
                material.Navigator.of(context).pop();
                await ScanFolderDialog(
                  folder: folder,
                ).showDialog(context);
              },
              label: material.Text('Scan "$folderName"'),
              icon: const material.Icon(
                material.Icons.repeat,
                size: AppSizes.points_24,
              ),
            )
          ],
        ),
      );
}
