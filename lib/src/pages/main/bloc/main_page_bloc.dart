import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import 'main_page_event.dart';
import 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc({
    required this.audioPlayer,
    required this.tabController,
  }) : super(const InitialState()) {
    on<OnInit>((final event, final emit) async {
      final playlist = ConcatenatingAudioSource(
        useLazyPreparation: true,
        shuffleOrder: DefaultShuffleOrder(),
        children: [
          // AudioSource.uri(
          //   Uri.parse(
          //     'https://ups.music-fa.com/tagdl/6e41/Mohammadreza%20Shajaryan%20-%20Gholame%20Chashm%20(320).mp3',
          //   ),
          // ),
          // AudioSource.uri(Uri.parse(
          //     'https://archive.org/download/skitarii-in-the-rectory-of-the-morbid-priesthood/Skitarii%20-%20In%20The%20Rectory%20Of%20The%20Morbid%20Priesthood%20-%2002%20Mycelial%20Miscreancy.wav')),
          AudioSource.uri(
            Uri.parse(
              'https://archive.org/download/LhasaDeSela./Lhasa%20de%20Sela..mp3',
            ),
          ),
        ],
      );
      await audioPlayer.setAudioSource(
        playlist,
        // initialIndex: 0,
        initialPosition: Duration.zero,
        preload: false,
        // preload: false,
      );
      // await state.audioPlayer.load();
      // await state.player.play();
    });
  }
  final AudioPlayer audioPlayer;
  final TabController tabController;
}
