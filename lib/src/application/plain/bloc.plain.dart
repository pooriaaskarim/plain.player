import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../domain/settings/model.settings.dart';
import '../../infrastructure/exceptions/exceptions.configuration.dart';
import '../../infrastructure/repositories/repository.audio.dart';
import '../../infrastructure/repositories/repository.configurations.dart';
import '../../infrastructure/repositories/repository.settings.dart';
import 'event.plain.dart';
import 'state.plain.dart';

class PlainBloc extends Bloc<PlainEvent, PlainState> {
  PlainBloc({
    required this.audioPlayer,
    required final SettingsRepository settingsRepository,
    required final ConfigurationsRepository configurationsRepository,
    required final AudioRepository audioRepository,
  })  : _settingsRepository = settingsRepository,
        _configurationsRepository = configurationsRepository,
        _audioRepository = audioRepository,
        super(
          PlainState.appLaunchState(
            defaultSettings: Settings.defaultSettings(),
          ),
        ) {
    on<OnAppLaunch>(_launchApp);
    on<OnLoadSettings>(_loadSettings);
    on<OnLoadConfigurations>(_loadConfigurations);
  }

  final AudioPlayer audioPlayer;
  late final SettingsRepository _settingsRepository;
  late final ConfigurationsRepository _configurationsRepository;
  late final AudioRepository _audioRepository;

  FutureOr<void> _launchApp(final event, final emit) async {
    // final playlist = ConcatenatingAudioSource(
    //   useLazyPreparation: true,
    //
    //   shuffleOrder: DefaultShuffleOrder(),
    //
    //   children: [
    //     // AudioSource.uri(
    //     //   Uri.parse(
    //     //     'https://ups.music-fa.com/tagdl/6e41/Mohammadreza%20Shajaryan%20-%20Gholame%20Chashm%20(320).mp3',
    //     //   ),
    //     // ),
    //     // AudioSource.uri(Uri.parse(
    //     //     'https://archive.org/download/skitarii-in-the-rectory-of-the-morbid-priesthood/Skitarii%20-%20In%20The%20Rectory%20Of%20The%20Morbid%20Priesthood%20-%2002%20Mycelial%20Miscreancy.wav')),
    //     AudioSource.uri(
    //       Uri.parse(
    //         'https://archive.org/download/LhasaDeSela./Lhasa%20de%20Sela..mp3',
    //
    //       ),
    //     ),
    //   ],
    // );
    // await audioPlayer.setAudioSource(
    //   playlist,
    //   // initialIndex: 0,
    //   initialPosition: Duration.zero,
    //   preload: false,
    //   // preload: false,
    // );
    // // await state.audioPlayer.load();
    // // await state.player.play();
  }

  FutureOr<void> _loadSettings(
    final OnLoadSettings event,
    final Emitter<PlainState> emit,
  ) async {
    emit(
      PlainState.loadingState(
        settings: state.settings,
        configuration: state.configuration,
      ),
    );
    if (event.settings != null) {
      emit(
        PlainState.defaultState(
          settings: event.settings!,
          configuration: state.configuration,
        ),
      );
    } else {
      Settings? settings;
      try {
        settings = await _settingsRepository.read();
      } on AppNotConfiguredException catch (e) {
        event.scaffoldMessengerState!
            .showSnackBar(SnackBar(content: Text(e.message)));
      } on Exception catch (e) {
        event.scaffoldMessengerState!
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
      emit(
        PlainState.defaultState(
          settings: settings ?? state.settings,
          configuration: state.configuration,
        ),
      );
      if (event.dismissDatabase!) {
        await _settingsRepository.dismissDb;
      }
    }
  }

  FutureOr<void> _loadConfigurations(
    final OnLoadConfigurations event,
    final Emitter<PlainState> emit,
  ) {}
}
