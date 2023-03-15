import 'package:equatable/equatable.dart';

import '../../domain/settings/app_setting.model.dart';

abstract class SettingsState extends Equatable {
  const SettingsState({required this.settings});
  factory SettingsState.defaultState({
    required final AppSetting settings,
  }) =>
      DefaultState._(settings: settings);

  final AppSetting settings;
  @override
  List<Object?> get props => [
        settings,
      ];
}

class DefaultState extends SettingsState {
  const DefaultState._({required super.settings});
  @override
  List<Object?> get props => [
        settings,
      ];
}
