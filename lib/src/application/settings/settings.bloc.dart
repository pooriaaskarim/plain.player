import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../domain/settings/app_setting.model.dart';
import '../../domain/settings/theme_config.model.dart';
import '../../infrastructure/exceptions/configuration.exceptions.dart';
import '../../repositories/settings_repository.dart';
import 'settings.event.dart';
import 'settings.state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(
          SettingsState.defaultState(
            settings: defaultSettings,
          ),
        ) {
    on<OnLoad>((final event, final emit) => load(emit, event));
    on<OnWriteDefaults>(
        (final event, final emit) => writeDefaults(emit, event));
    on<OnUpdate>((final event, final emit) => _update(emit, event));
  }
  final SettingsRepository _repository = SettingsRepository();

  static AppSetting defaultSettings =
      AppSetting(themeConfig: const ThemeConfig(themeMode: ThemeMode.light));

  Future<void> load(
    final Emitter<SettingsState> emit,
    final OnLoad event,
  ) async {
    final AppSetting currentSettings;

    try {
      currentSettings = await _repository.read;
    } on AppNotConfiguredException catch (_) {
      rethrow;
    }
    emit(
      SettingsState.defaultState(
        settings: currentSettings,
      ),
    );
  }

  Future<void> writeDefaults(
    final Emitter<SettingsState> emit,
    final OnWriteDefaults event,
  ) async {
    await _repository.write(defaultSettings);
  }

  Future<void> _update(
    final Emitter<SettingsState> emit,
    final OnUpdate event,
  ) async {
    assert(event.themeConfig != null, 'At least one argument is required');
    if ((event.themeConfig) != null) {
      await _repository.update(themeConfig: event.themeConfig);
    }
  }
}
