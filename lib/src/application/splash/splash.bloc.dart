import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/exceptions/configuration.exceptions.dart';
import '../../infrastructure/routes/route_names.dart';
import '../../infrastructure/utils/app_utils.dart';
import '../../presentation/splash/widgets/error_state/error_state_widget.dart';
import '../settings/settings.bloc.dart';
import '../settings/settings.event.dart' as settings_event;
import 'splash.event.dart';
import 'splash.state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({
    required this.settingsBloc,
    required this.navigatorState,
    this.fakeDelay = 2,
  }) : super(
          InitialState(
            themeMode: settingsBloc.state.settings.themeConfig.themeMode,
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
    required final Emitter<SplashState> emit,
    required final OnInit event,
  }) async {
    await AppUtils.fakeDelay(seconds: fakeDelay);
    if (!isClosed) {
      add(const OnLoad());
    }
  }

  Future<void> _load({
    required final Emitter<SplashState> emit,
    required final OnLoad event,
  }) async {
    emit(
      LoadingState(
        themeMode: state.themeMode,
      ),
    );
    await AppUtils.fakeDelay(seconds: fakeDelay);
    try {
      settingsBloc.add(settings_event.SettingsEvent.load());
    } on AppNotConfiguredException catch (e) {
      debugPrint('Caught AppNotConfiguredException:$e');
      // state.stateWidget = const Text('Initializing');
      // emit(
      //   LoadingState(
      //     themeMode: state.themeMode,
      //     stateWidget: const Text('Initializing'),
      //   ),
      // );
      settingsBloc.add(settings_event.SettingsEvent.writeDefaults());
      debugPrint('___________NOW WRITING');
      await AppUtils.fakeDelay(seconds: fakeDelay);
      settingsBloc.add(settings_event.SettingsEvent.load());
      debugPrint('___________NOW LOADING');
    } on Exception catch (e) {
      debugPrint('___________Error Occurred');
      add(
        OnError(
          errorMessage: e.toString(),
        ),
      );
    }
    add(
      OnSuccess(
        themeMode: settingsBloc.state.settings.themeConfig.themeMode,
      ),
    );
  }

  Future<void> _success({
    required final Emitter<SplashState> emit,
    required final OnSuccess event,
  }) async {
    emit(
      SuccessState(
        themeMode: event.themeMode,
      ),
    );
    await AppUtils.fakeDelay(seconds: fakeDelay);
    await navigatorState.popAndPushNamed(AppRouteNames.homePage);
  }

  Future<void> _error({
    required final Emitter<SplashState> emit,
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
