import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'widgets/plain_button/widget.plain_button.dart';
import 'widgets/seeking_bar/widget.seeking_bar.dart';

class Player extends StatelessWidget {
  const Player({
    required this.audioPlayer,
    super.key,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PlainButtonWidget(
            audioPlayer: audioPlayer,
          ),
          SeekingBarWidget(audioPlayer: audioPlayer),
        ],
      );
}
