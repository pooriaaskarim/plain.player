import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../application/plain/bloc.plain.dart';
import '../i.plain.tab.dart';
import 'widgets/plain_button/widget.plain_button.dart';
import 'widgets/seeking_bar/widget.seeking_bar.dart';

class PlayerTab extends StatefulWidget implements PlainTab {
  const PlayerTab({
    required this.audioPlayer,
    super.key,
  });
  final AudioPlayer audioPlayer;

  @override
  FloatingActionButton? floatingActionButton(final BuildContext context) =>
      FloatingActionButton(
        highlightElevation: 6,
        onPressed: () async {
          final FilePickerResult? file = await FilePicker.platform.pickFiles(
            allowMultiple: false,
            type: FileType.audio,
          );
          if (file != null) {
            await BlocProvider.of<PlainBloc>(context)
                .audioPlayer
                .setUrl(file.files.first.path!);
          }
        },
        child: const Icon(
          Icons.audiotrack,
        ),
      );
  @override
  State<PlayerTab> createState() => _PlayerTabState();
}

class _PlayerTabState extends State<PlayerTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(final BuildContext context) {
    super.build(context);
    int willPopCount = 0;

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          willPopCount++;
          if (willPopCount == 2) {
            return true;
          }
          await ScaffoldMessenger.of(context)
              .showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    'Press back again to close app.',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
              )
              .closed
              .then((final value) => willPopCount = 0);
          return false;
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PlainButtonWidget(
              audioPlayer: widget.audioPlayer,
            ),
            SeekingBarWidget(audioPlayer: widget.audioPlayer),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
