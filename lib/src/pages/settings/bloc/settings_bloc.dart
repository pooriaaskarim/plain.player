import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/services/storage_service.dart';
import '../../../infrastructure/theme/app_theme.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState(themeData: AppTheme.lightTheme)) {
    on<OnLoadSettings>((event, emit) => _loadSettings(emit, event));
    on<OnToggleTheme>((event, emit) => _toggleTheme(emit));
  }

  void _loadSettings(Emitter<SettingsState> emit, OnLoadSettings event) {
    emit(SettingsState(themeData: event.themeData));
  }

  void _toggleTheme(Emitter<SettingsState> emit) {
    final themeData = (state.themeData == AppTheme.lightTheme)
        ? AppTheme.darkTheme
        : AppTheme.lightTheme;
    saveTheme(themeData);
    emit(SettingsState(themeData: themeData));
  }

  void saveTheme(ThemeData themeData) {
    String value = (themeData == AppTheme.lightTheme) ? 'light' : 'dark';
    AppStorageService.put<String>(key: 'theme', value: value);
  }
}
