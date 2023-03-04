import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/routes/route_names.dart';
import '../../../infrastructure/services/storage_service.dart';
import '../../../infrastructure/theme/app_theme.dart';
import '../../../infrastructure/utils/app_utils.dart';
import '../../../infrastructure/utils/color_utils.dart';
import '../../settings/bloc/settings_bloc.dart';
import '../../settings/bloc/settings_event.dart';
import 'splash_screen_event.dart';
import 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc({
    required this.settingsBloc,
    required this.navigatorState,
  }) : super(
          InitialState(
            themeData: AppTheme.lightTheme,
            statusWidget: AppUtils.emtyWidget,
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
  final SettingsBloc settingsBloc;
  final NavigatorState navigatorState;

  Future<void> _init({
    required final Emitter<SplashScreenState> emit,
    required final OnInit event,
  }) async {
    await AppUtils.fakeDelay(seconds: 15);
    add(const OnLoad());
  }

  Future<void> _load({
    required final Emitter<SplashScreenState> emit,
    required final OnLoad event,
  }) async {
    emit(
      LoadState(
        themeData: state.themeData,
        statusWidget: const CircularProgressIndicator(),
      ),
    );
    final ThemeData themeData = await _getTheme();
    await AppUtils.fakeDelay();
    emit(
      SuccessState(
        themeData: themeData,
        statusWidget: const Icon(
          Icons.check,
          size: AppUtils.xLargeSize,
        ),
      ),
    );
    add(OnSuccess(themeData: themeData));
  }

  Future<ThemeData> _getTheme() async {
    String? theme;
    final ThemeData themeData;
    try {
      theme = await AppStorageService.get(key: 'theme');
    } catch (e, s) {
      add(
        OnError(errorTooltip: e.toString()),
      );
      Exception(s);
    }
    if (theme == null) {
      themeData = AppTheme.lightTheme;
      settingsBloc
          .saveTheme(themeData); // Saves light theme as default on first run
    } else {
      themeData = (theme == 'light') ? AppTheme.lightTheme : AppTheme.darkTheme;
    }

    return themeData;
  }

  Future<void> _success({
    required final Emitter<SplashScreenState> emit,
    required final OnSuccess event,
  }) async {
    settingsBloc.add(OnLoadSettings(themeData: event.themeData));
    await AppUtils.fakeDelay(seconds: 3);
    await navigatorState.popAndPushNamed(AppRouteNames.homePage);
  }

  Future<void> _error({
    required final Emitter<SplashScreenState> emit,
    required final OnError event,
  }) async {
    emit(
      ErrorState(
        themeData: state.themeData,
        statusWidget: Tooltip(
          message: event.errorTooltip,
          child: Icon(
            Icons.error,
            size: AppUtils.xLargeSize,
            color: ColorUtils.lightColorScheme.error,
          ),
        ),
      ),
    );
  }
}
