import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/routes/route_names.dart';
import '../../../infrastructure/services/storage_service.dart';
import '../../../infrastructure/utils/app_utils.dart';
import '../../settings/bloc/settings_bloc.dart';
import '../../settings/bloc/settings_event.dart';
import '../../settings/models/settings.dart';
import '../views/widgets/error_state/error_state_widget.dart';
import 'splash_screen_event.dart';
import 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc({
    required this.settingsBloc,
    required this.navigatorState,
    this.fakeDelay = 2,
  }) : super(
          const InitialState(
            themeMode: ThemeMode.light,
          ),
        ) {
    on<OnInit>(
      (final event, final emit) => _init(
        emit: emit,
        event: event,
      ),
    );
    on<OnLoad>(
      (final event, final emit) => _load(
        emit: emit,
        event: event,
      ),
    );
    on<OnSuccess>(
      (final event, final emit) => _success(
        emit: emit,
        event: event,
      ),
    );
    on<OnError>(
      (final event, final emit) => _error(
        emit: emit,
        event: event,
      ),
    );
  }
  final int fakeDelay;
  final SettingsBloc settingsBloc;
  final NavigatorState navigatorState;

  Future<void> _init({
    required final Emitter<SplashScreenState> emit,
    required final OnInit event,
  }) async {
    await AppUtils.fakeDelay(seconds: fakeDelay);
    if (!isClosed) {
      add(const OnLoad());
    }
  }

  Future<void> _load({
    required final Emitter<SplashScreenState> emit,
    required final OnLoad event,
  }) async {
    emit(
      LoadState(
        themeMode: state.themeMode,
      ),
    );
    await AppUtils.fakeDelay(seconds: fakeDelay);
    final ThemeMode themeMode = await _getTheme();
    // add(OnError(errorMessage: 'e.toString()'));
    add(OnSuccess(themeMode: themeMode));
  }

  Future<ThemeMode> _getTheme() async {
    Settings? settings;
    try {
      settings = await StorageService.instance().get(key: 'Settings');
    } on FileSystemException catch (e, s) {
      add(
        OnError(errorMessage: e.toString()),
      );
      Exception(s);
    }
    if (settings == null) {
      settingsBloc.saveTheme(
          ThemeMode.light); // Saves light theme as default on first run
    }
    return settings?.themeMode ?? ThemeMode.light;
  }

  Future<void> _success({
    required final Emitter<SplashScreenState> emit,
    required final OnSuccess event,
  }) async {
    emit(
      SuccessState(
        themeMode: event.themeMode,
      ),
    );
    settingsBloc.add(OnLoadSettings(themeMode: event.themeMode));
    await AppUtils.fakeDelay(seconds: fakeDelay);
    await navigatorState.popAndPushNamed(AppRouteNames.homePage);
  }

  Future<void> _error({
    required final Emitter<SplashScreenState> emit,
    required final OnError event,
  }) async {
    emit(
      ErrorState(
        themeMode: state.themeMode,
        stateWidget: ErrorStateWidget(
          errorMessage: event.errorMessage,
        ),
      ),
    );
  }
}
