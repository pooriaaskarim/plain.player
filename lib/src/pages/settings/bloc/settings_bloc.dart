import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/services/storage_service.dart';
import '../../../infrastructure/theme/app_theme.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState(themeData: AppTheme.lightTheme)) {
    on<OnLoadSettings>((final event, final emit) => _loadSettings(emit, event));
    on<OnToggleTheme>((final event, final emit) => _toggleTheme(emit));
  }

  void _loadSettings(
    final Emitter<SettingsState> emit,
    final OnLoadSettings event,
  ) {
    emit(SettingsState(themeData: event.themeData));
  }

  void _toggleTheme(final Emitter<SettingsState> emit) {
    final themeData = (state.themeData == AppTheme.lightTheme)
        ? AppTheme.darkTheme
        : AppTheme.lightTheme;
    saveTheme(themeData);
    emit(SettingsState(themeData: themeData));
  }

  void saveTheme(final ThemeData themeData) {
    final String value = (themeData == AppTheme.lightTheme) ? 'light' : 'dark';
    AppStorageService.put<String>(key: 'theme', value: value);
  }
}
