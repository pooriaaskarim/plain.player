import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../domain/settings/settings.model.dart';
import '../../domain/settings/theme_config.model.dart';
import '../../infrastructure/exceptions/configuration.exceptions.dart';
import '../../infrastructure/repositories/repository.settings.dart';
import '../plain/plain.bloc.dart';
import '../plain/plain.event.dart';
import 'settings.state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required this.plainBloc,
    required this.scaffoldMessengerState,
    required final SettingsRepository settingsRepository,
  })  : _settingsRepository = settingsRepository,
        super(
          SettingsState.defaultState(
            settings: plainBloc.state.settings,
          ),
        );
  late final SettingsRepository _settingsRepository;
  final ScaffoldMessengerState scaffoldMessengerState;
  final PlainBloc plainBloc;

  Future<void> load() async {
    Settings settings;
    try {
      settings = await _settingsRepository.read();
    } on AppNotConfiguredException catch (e) {
      scaffoldMessengerState.showSnackBar(SnackBar(content: Text(e.message)));
      return;
    } on Exception catch (e) {
      scaffoldMessengerState
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return;
    }
    emit(SettingsState.defaultState(settings: settings));
    plainBloc.add(
      PlainEvent.loadSettings(
        state.settings,
      ),
    );
  }

  void get syncSettingsState =>
      emit(SettingsState.defaultState(settings: plainBloc.state.settings));

  Future<void> writeDefaults() async {
    await _settingsRepository.write(Settings.defaultSettings());
  }

  Future<void> update({
    final ThemeConfig? themeConfig,
  }) async {
    assert(themeConfig != null, 'At least one argument is required');
    if (themeConfig != null) {
      await _settingsRepository.update(themeConfig: themeConfig);
    }
  }

  @override
  Future<void> close() {
    _settingsRepository.dismissDb;
    return super.close();
  }
}
