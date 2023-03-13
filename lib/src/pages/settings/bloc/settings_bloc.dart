import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/services/storage_service.dart';
import '../models/settings.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState(themeMode: ThemeMode.light)) {
    on<OnLoadSettings>((final event, final emit) => _loadSettings(emit, event));
    on<OnToggleTheme>((final event, final emit) => _toggleTheme(emit));
  }

  void _loadSettings(
    final Emitter<SettingsState> emit,
    final OnLoadSettings event,
  ) {
    emit(SettingsState(themeMode: event.themeMode));
  }

  void _toggleTheme(final Emitter<SettingsState> emit) {
    final ThemeMode themeMode =
        (state.themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    saveTheme(themeMode);
    emit(SettingsState(themeMode: themeMode));
  }

  void saveTheme(final ThemeMode themeMode) {
    final Settings settingsDto = Settings(themeMode: themeMode);
    StorageService.instance().put<Settings>(
      key: 'Settings',
      value: settingsDto,
    );
  }
}
