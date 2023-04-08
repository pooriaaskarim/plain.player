import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/plain/bloc.plain.dart';
import '../../../../../domain/audio_library/model.folder.dart';

class DeleteFolderDialog extends StatelessWidget {
  const DeleteFolderDialog({
    required this.folder,
    super.key,
  });

  final Folder folder;

  @override
  Widget build(final BuildContext context) => AlertDialog(
        title: const Text('Delete Folder'),
        icon: const Icon(Icons.warning_amber),
        content: const Text('''
Resources in this folder will be excluded. Are you sure you want to delete this folder?'''),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => BlocProvider.of<PlainBloc>(context)
                .audioLibraryHandler
                .deleteFolder(
                  folder,
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
        ],
      );
}
