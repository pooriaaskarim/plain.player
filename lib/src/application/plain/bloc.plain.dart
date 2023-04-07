import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../domain/settings/model.settings.dart';
import '../../infrastructure/exceptions/exceptions.configuration.dart';
import '../../infrastructure/repositories/repository.configurations.dart';
import '../../infrastructure/repositories/repository.settings.dart';
import '../audio_library/cubit.audio_library.dart';
import 'events/event.plain.dart';
import 'states/state.plain.dart';

class PlainBloc extends Bloc<PlainEvent, PlainState> {
  PlainBloc({
    required this.audioPlayer,
    required this.audioLibraryHandler,
    required final SettingsRepository settingsRepository,
    required final ConfigurationsRepository configurationsRepository,
  })  : _settingsRepository = settingsRepository,
        _configurationsRepository = configurationsRepository,
        super(
          PlainState.appLaunch(
            defaultSettings: Settings.defaultSettings(),
          ),
        ) {
    on<OnAppLaunch>(_launchApp);
    on<OnLoadSettings>(_loadSettings);
    on<OnLoadConfigurations>(_loadConfigurations);
  }

  final AudioPlayer audioPlayer;
  final AudioLibraryCubit audioLibraryHandler;
  late final SettingsRepository _settingsRepository;
  late final ConfigurationsRepository _configurationsRepository;

  FutureOr<void> _launchApp(final event, final emit) async {}

  FutureOr<void> _loadSettings(
    final OnLoadSettings event,
    final Emitter<PlainState> emit,
  ) async {
    emit(
      PlainState.loading(
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
