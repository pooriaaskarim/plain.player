import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mime/mime.dart';

import '../../../../../application/plain/bloc.plain.dart';
import '../../../../../domain/audio_library/model.folder.dart';
import '../../../../../infrastructure/utils/extensions/extension.filesystem_entity.is_audio.dart';
import '../../../../shared/widgets/widget.scrolling_text.dart';

class FolderContentDialog extends StatefulWidget {
  const FolderContentDialog({
    required this.folder,
    super.key,
  });

  final Folder folder;

  @override
  State<FolderContentDialog> createState() => _FolderContentDialogState();
}

class _FolderContentDialogState extends State<FolderContentDialog> {
  late final Directory _rootDirectory;
  late Directory _currentDirectory;

  @override
  void initState() {
    super.initState();
    _rootDirectory = widget.folder.directory;
    _currentDirectory = _rootDirectory;
  }

  @override
  Widget build(final BuildContext context) {
    final listSync = _currentDirectory.listSync();
    if (_currentDirectory != _rootDirectory) {
      listSync.insert(0, _currentDirectory.parent);
    }

    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: ScrollingText(
            text: _currentDirectory.path.split('/').last,
            textStyle: Theme.of(context).appBarTheme.titleTextStyle!,
            size: MediaQuery.of(context).size,
          ),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: listSync.length,
          itemBuilder: (final context, final index) => OutlinedButton(
            onPressed: () async {
              final entity = listSync[index];
              debugPrint('--------------------------------');
              debugPrint(entity.path);
              debugPrint(lookupMimeType(entity.path));

              if (await entity.exists()) {
                if (entity.isAudio) {
                  if (entity.isSupportedAudio) {
                    await BlocProvider.of<PlainBloc>(context)
                        .audioPlayer
                        .setUrl(entity.path);
                    Navigator.of(context).pop();
                    BlocProvider.of<PlainBloc>(context)
                        .tabController
                        .animateTo(0);
                    return;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Audio ${entity.path.split('/').last}'
                            ' is not Supported'),
                      ),
                    );
                    return;
                  }
                } else if (entity.isDirectory) {
                  setState(() {
                    _currentDirectory = (entity.path == _rootDirectory.path)
                        ? _rootDirectory
                        : Directory(entity.path);
                  });
                  return;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('file ${entity.path.split('/').last}'
                          ' is not Supported'),
                    ),
                  );
                  return;
                }
              }
            },
            child: LayoutBuilder(
              builder: (final context, final constraints) => ScrollingText(
                text: (listSync[index].path == _currentDirectory.parent.path)
                    ? '../'
                    : listSync[index].path.split('/').last,
                size: constraints.biggest,
                textStyle: Theme.of(context).textTheme.bodyMedium!,
                maxLines: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
