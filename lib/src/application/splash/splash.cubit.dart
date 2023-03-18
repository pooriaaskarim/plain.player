import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/settings/settings.model.dart';
import '../../infrastructure/exceptions/configuration.exceptions.dart';
import '../../infrastructure/repositories/repository.configurations.dart';
import '../../infrastructure/repositories/repository.settings.dart';
import '../../infrastructure/routes/route_names.dart';
import '../../infrastructure/utils/app_utils.dart';
import '../../presentation/splash/widgets/state_widgets/error_state.widget.dart';
import '../../presentation/splash/widgets/state_widgets/first_launch.widget.dart';
import '../plain/plain.bloc.dart';
import '../plain/plain.event.dart' as plain_event;
import 'splash.state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required this.navigatorState,
    required this.plainBloc,
    required final SettingsRepository settingsRepository,
    required final ConfigurationsRepository configurationsRepository,
    this.fakeDelay = 2,
  }) : super(
          SplashState.initial(),
        ) {
    _settingsRepository = settingsRepository;
    _configurationsRepository = configurationsRepository;
  }

  final int fakeDelay;
  final NavigatorState navigatorState;
  final PlainBloc plainBloc;
  late final SettingsRepository _settingsRepository;
  late final ConfigurationsRepository _configurationsRepository;

  FutureOr<void> loadSettings() async {
    final Settings settings;
    try {
      settings = await _settingsRepository.read();
    } on AppNotConfiguredException catch (_) {
      emit(SplashState.loading(widget: const FirstLaunchWidget()));
      writeDefaultSettings();
      return;
    } on Exception catch (e, s) {
      //Todo: Test for some errors and exceptions
      await onError(e, s);
      return;
    }
    emit(SplashState.loading());
    plainBloc.add(plain_event.PlainEvent.loadSettings(settings));
    loadConfigurations();
  }

  FutureOr<void> writeDefaultSettings() async {
    await _settingsRepository.write(Settings.defaultSettings());
    await AppUtils.fakeDelay(seconds: fakeDelay);
    onSuccess();
  }

  FutureOr<void> loadConfigurations() async {
    await AppUtils.fakeDelay(seconds: fakeDelay);

    //todo: load and pass configurations to plain bloc
    //    plainBloc.add(plain_event.PlainEvent.loadConfigurations());
    onSuccess();
  }

  FutureOr<void> onSuccess() async {
    emit(SplashState.success());
    await AppUtils.fakeDelay(seconds: fakeDelay);
    await navigatorState.popAndPushNamed(AppRouteNames.homePage);
  }

  @override
  Future<void> onError(final Object error, final StackTrace stackTrace) async {
    emit(
      SplashState.error(
        widget: ErrorStateWidget(
          errorMessage: error.toString(),
        ),
      ),
    );
    super.onError(error, stackTrace);
  }

  @override
  Future<void> close() {
    _settingsRepository.dismissDb;
    _configurationsRepository.dismissDb;
    return super.close();
  }
}
