import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/settings/model.settings.dart';

part 'event.app_launch.dart';
part 'event.load_configurations.dart';
part 'event.load_settings.dart';

abstract class PlainEvent extends Equatable {
  const PlainEvent();
  factory PlainEvent.launchApp({
    required final Settings defaultSettings,
  }) =>
      OnAppLaunch._(defaultSettings: defaultSettings);
  factory PlainEvent.readSettings({
    required final ScaffoldMessengerState scaffoldMessengerState,
    final bool dismissDatabase = false,
  }) =>
      OnLoadSettings._fromDb(
        scaffoldMessengerState: scaffoldMessengerState,
        dismissDatabase: dismissDatabase,
        settings: null,
      );
  factory PlainEvent.loadSettings(
    final Settings settings,
  ) =>
      OnLoadSettings._fromObject(
        settings: settings,
        dismissDatabase: null,
        scaffoldMessengerState: null,
      );
  factory PlainEvent.loadConfigurations({
    final bool dismissDatabase = false,
  }) =>
      OnLoadConfigurations._(dismissDatabase: dismissDatabase);

  @override
  List<Object?> get props => [];
}
