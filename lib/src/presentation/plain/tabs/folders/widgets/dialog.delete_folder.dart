import 'package:flutter/material.dart' as material;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/audio_library/cubit.audio_library.dart';
import '../../../../../domain/audio_library/model.folder.dart';

class DeleteFolderDialog extends material.StatelessWidget {
  const DeleteFolderDialog({
    required this.folder,
    super.key,
  });
  final Folder folder;
  String get folderName => folder.path.split('/').last;
  Future<void> showDialog(final material.BuildContext context) =>
      material.showDialog<bool>(
        context: context,
        builder: (final context) => DeleteFolderDialog(
          folder: folder,
        ),
      );

  @override
  material.Widget build(final material.BuildContext context) =>
      material.AlertDialog(
        title: const material.Text('Delete Folder'),
        icon: const material.Icon(material.Icons.warning_amber),
        content: material.Text('''
Resources in this folder will be excluded. Are you sure you want to "$folderName"?'''),
        actions: [
          material.TextButton(
            onPressed: () => material.Navigator.of(context).pop<bool>(false),
            child: const material.Text('No'),
          ),
          material.TextButton(
            onPressed: () async {
              final audioLibraryCubit =
                  BlocProvider.of<AudioLibraryCubit>(context);
              final navigatorState = material.Navigator.of(context);
              final scaffoldMessengerState =
                  material.ScaffoldMessenger.of(context);
              final bool isDeleted = await audioLibraryCubit.deleteFolder(
                folder,
              );
              if (isDeleted) {
                await audioLibraryCubit.loadFolders();
                navigatorState.pop(isDeleted);
              } else {
                scaffoldMessengerState.showSnackBar(
                  material.SnackBar(
                    content: material.Text('Could not delete "$folderName"'),
                  ),
                );
                navigatorState.pop(isDeleted);
              }
            },
            child: const material.Text('Yes'),
          ),
        ],
      );
}
