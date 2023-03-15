import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/exceptions/configuration.exceptions.dart';
import '../models/settings.dart';
import '../models/theme_config.dart';
import '../repositories/settings_repository.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(
          SettingsState.defaultState(
            settings: defaultSettings,
          ),
        ) {
    on<OnLoad>((final event, final emit) => _load(emit, event));
    on<OnWriteDefaults>(
        (final event, final emit) => _writeDefaults(emit, event));
    on<OnUpdate>((final event, final emit) => _update(emit, event));
  }
  final SettingsRepository _repository = SettingsRepository();

  static Settings defaultSettings =
      Settings(themeConfig: const ThemeConfig(themeMode: ThemeMode.light));

  Future<void> _load(
    final Emitter<SettingsState> emit,
    final OnLoad event,
  ) async {
    Settings? currentSettings;

    try {
      currentSettings = await _repository.read;
    } on AppNotConfiguredException catch (_) {
      add(SettingsEvent.writeDefaults());
      rethrow;
    }
    emit(
      SettingsState.defaultState(
        settings: currentSettings,
      ),
    );
  }

  Future<void> _writeDefaults(
    final Emitter<SettingsState> emit,
    final OnWriteDefaults event,
  ) async {
    debugPrint('__________________xxxxxxx');
    debugPrint('${await _repository.write(defaultSettings)}');
    add(SettingsEvent.load());
    debugPrint('__________________yyyyyy');
  }

  Future<void> _update(
    final Emitter<SettingsState> emit,
    final OnUpdate event,
  ) async {
    assert(event.themeConfig != null, 'At least one argument is required');
    if ((event.themeConfig) != null) {
      await _repository.update(themeConfig: event.themeConfig);
    }
    add(SettingsEvent.load());
  }
}
