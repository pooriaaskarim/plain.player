import 'package:equatable/equatable.dart';

import '../../domain/settings/theme_config.model.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
  factory SettingsEvent.load() => const OnLoad._();
  factory SettingsEvent.writeDefaults() => const OnWriteDefaults._();
  factory SettingsEvent.update({final ThemeConfig? themeConfig}) =>
      OnUpdate._(themeConfig: themeConfig);
  @override
  List<Object?> get props => [];
}

class OnLoad extends SettingsEvent {
  const OnLoad._();
  @override
  List<Object> get props => [];
}

class OnWriteDefaults extends SettingsEvent {
  const OnWriteDefaults._();
  @override
  List<Object> get props => [];
}

class OnUpdate extends SettingsEvent {
  const OnUpdate._({this.themeConfig});
  final ThemeConfig? themeConfig;
  @override
  List<Object?> get props => [
        themeConfig,
      ];
}
