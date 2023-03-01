import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/services/storage_service.dart';
import '../../../infrastructure/theme/app_theme.dart';
import '../../../infrastructure/utils/app_utils.dart';
import '../../../infrastructure/utils/color_utils.dart';
import '../../settings/bloc/settings_bloc.dart';
import '../../settings/bloc/settings_event.dart';
import '../views/widgets/gooshi.dart';
import 'splash_screen_event.dart';
import 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc({
    required this.settingsBloc,
  }) : super(
          const InitialState(),
        ) {
    on<OnInit>((final event, final emit) => _init());
    on<OnLoad>((final event, final emit) => _load(emit));
    on<OnSuccess>((final event, final emit) => _success(emit, event));
    on<OnError>((final event, final emit) => _error(emit, event));
  }
  final SettingsBloc settingsBloc;

  Future<void> _init() async {
    await AppUtils.fakeDelay(seconds: 2);
    add(OnLoad());
  }

  Future<void> _load(final Emitter<SplashScreenState> emit) async {
    emit(
      const LoadState(
        loadingWidget: CircularProgressIndicator(),
      ),
    );
    final ThemeData themeData = await _getTheme();
    await AppUtils.fakeDelay();
    add(OnSuccess(themeData: themeData));
  }

  Future<ThemeData> _getTheme() async {
    String? theme;
    final ThemeData themeData;
    try {
      theme = await AppStorageService.get(key: 'theme');
    } catch (e, s) {
      add(
        OnError(error: e.toString()),
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

  Future<void> _success(
    final Emitter<SplashScreenState> emit,
    final OnSuccess event,
  ) async {
    emit(
      SuccessState(
        logoWidget: Gooshi(color: event.themeData.primaryColor),
        loadingWidget: const Icon(
          Icons.check,
          size: AppUtils.xLargeSize,
        ),
      ),
    );
    settingsBloc.add(OnLoadSettings(themeData: event.themeData));
  }

  Future<void> _error(
    final Emitter<SplashScreenState> emit,
    final OnError event,
  ) async {
    emit(
      ErrorState(
        loadingWidget: Tooltip(
          message: event.error,
          child: Icon(
            Icons.error,
            size: AppUtils.xLargeSize,
            color: ColorUtils.lightColorScheme.error,
            semanticLabel: event.error,
          ),
        ),
      ),
    );
  }
}
