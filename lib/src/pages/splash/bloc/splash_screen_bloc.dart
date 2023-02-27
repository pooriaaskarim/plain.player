import 'package:pood/src/infrastructure/utils/app_utils.dart';
import 'package:pood/src/pages/splash/views/widgets/gooshi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/services/storage_service.dart';
import '../../../infrastructure/theme/app_theme.dart';
import '../../settings/bloc/settings_bloc.dart';
import '../../settings/bloc/settings_event.dart';
import 'splash_screen_event.dart';
import 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final SettingsBloc settingsBloc;

  SplashScreenBloc({
    required this.settingsBloc,
  }) : super(
          const InitialState(),
        ) {
    on<OnInit>((event, emit) => _init());
    on<OnLoad>((event, emit) async => await _load(emit));
    on<OnSuccess>((event, emit) async => await _success(emit, event));
    on<OnError>((event, emit) async => _error());
  }

  _init() async {
    await AppUtils.fakeDelay(seconds: 2);
    add(OnLoad());
  }

  Future<void> _load(Emitter<SplashScreenState> emit) async {
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
    final String? theme = await AppStorageService.get(key: 'theme');
    final ThemeData themeData;
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
      Emitter<SplashScreenState> emit, OnSuccess event) async {
    emit(SuccessState(
      logoWidget: Gooshi(color: event.themeData.primaryColor),
      loadingWidget: const Icon(
        Icons.check,
        size: AppUtils.xLargeSize,
      ),
    ));
    settingsBloc.add(OnLoadSettings(themeData: event.themeData));
  }

  void _error() async {}
}
