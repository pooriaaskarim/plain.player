import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'widgets/main_button/plain_button_widget.dart';
import 'widgets/seeking_bar/seeking_bar.dart';

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
          SeekingBar(audioPlayer: audioPlayer),
        ],
      );
}
