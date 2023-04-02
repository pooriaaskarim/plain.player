import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../shared/widgets/widget.loading.dart';
import '../plain.tab.i.dart';
import 'widgets/plain_button/widget.plain_button.dart';
import 'widgets/seeking_bar/widget.seeking_bar.dart';

class PlayerTab extends StatelessWidget implements PlainTab {
  const PlayerTab({
    required this.audioPlayer,
    super.key,
  });
  final AudioPlayer audioPlayer;
  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Loading(
            color: Theme.of(context).primaryColor,
          ),
          PlainButtonWidget(
            audioPlayer: audioPlayer,
          ),
          SeekingBarWidget(audioPlayer: audioPlayer),
        ],
      );

  @override
  FloatingActionButton? floatingActionButton(final BuildContext context) =>
      null;
  // FloatingActionButton(
  //   onPressed: () async {
  //     final FilePickerResult? file = await FilePicker.platform.pickFiles(
  //       allowMultiple: false,
  //       type: FileType.audio,
  //     );
  //     if (file != null) {
  //       await BlocProvider.of<PlainBloc>(context)
  //           .audioPlayer
  //           .setUrl(file.files.first.path!);
  //     }
  //   },
  //   child: const Icon(
  //     Icons.audiotrack,
  //   ),
  // );
}
