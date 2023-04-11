import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/plain/bloc.plain.dart';
import '../../../../../domain/audio_library/model.folder.dart';
import '../../../../../infrastructure/utils/app.sizes.dart';
import '../../../../../infrastructure/utils/extensions/extension.filesystem_entity.is_audio.dart';
import '../../../screen.plain.dart';
import '../tab.folders.dart';
import 'widget.folder_content_audio_item.dart';
import 'widget.folder_content_folder_item.dart';

class FolderContentList extends StatefulWidget {
  const FolderContentList({
    required this.folder,
    required this.key,
  }) : super(key: key);
  @override
  final GlobalKey<FolderContentListState> key;
  final Folder folder;

  @override
  State<FolderContentList> createState() => FolderContentListState();
}

class FolderContentListState extends State<FolderContentList> {
  late Directory rootDirectory;
  late Directory currentDirectory;
  FoldersTabState? _parentState;
  TextStyle? get textStyle => Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      );
  late bool isInitialBuild;

  @override
  void initState() {
    super.initState();
    isInitialBuild = true;
    currentDirectory = rootDirectory = widget.folder.directory;
  }

  @override
  void didChangeDependencies() {
    _parentState =
        context.dependOnInheritedWidgetOfExactType<FoldersTabData>()?.state;
    if (isInitialBuild) {
      WidgetsBinding.instance.addPostFrameCallback(
        (final _) => _parentState?.parentState?.setState(() {}),
      );
      isInitialBuild = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(final BuildContext context) {
    final List<FileSystemEntity> directoryTree = currentDirectory.listSync()
      ..sort(
        (final a, final b) => a.path.compareTo(b.path),
      )
      ..removeWhere(
        (final element) => element.path.split('/').last.startsWith('.'),
      );
    if (currentDirectory.path != rootDirectory.path) {
      directoryTree.insert(0, currentDirectory.parent);
    }
    return ListView.builder(
      primary: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (final context, final index) {
        final fileSystemEntity = directoryTree[index];

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.points_0,
            vertical: AppSizes.points_4,
          ),
          child: fileSystemEntity.isDirectory
              ? FolderContentFolderItem(
                  directory: fileSystemEntity,
                  currentDirectory: currentDirectory,
                  onTap: () async {
                    if (await fileSystemEntity.exists()) {
                      handleDirectory(fileSystemEntity);
                      return;
                    }
                  },
                )
              : fileSystemEntity.isAudio
                  ? FolderContentAudioItem(
                      audio: fileSystemEntity,
                      onTap: () async {
                        await _handleAudio(fileSystemEntity);
                        return;
                      },
                    )
                  : null,
        );
      },
      itemCount: directoryTree.length,
    );
  }

  void handleDirectory(final FileSystemEntity fileSystemEntity) {
    setState(() {
      if (rootDirectory.parent.path == fileSystemEntity.path) {
        WidgetsBinding.instance.addPostFrameCallback((final _) {
          _parentState
            ?..currentFolder = null
            ..showFAB = true
            ..setState(() {});
          _parentState?.parentState?.setState(() {});
        });
      } else {
        currentDirectory = Directory(fileSystemEntity.path);
      }
    });
  }

  Future<void> _handleAudio(final FileSystemEntity fileSystemEntity) async {
    if (fileSystemEntity.isSupportedAudio) {
      await BlocProvider.of<PlainBloc>(context)
          .audioPlayer
          .setUrl(fileSystemEntity.path);
      PlainScreen.of(context).tabController.animateTo(0);

      return;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Audio ${fileSystemEntity.path.split('/').last}'
              ' is not Supported'),
        ),
      );
      return;
    }
  }
}
