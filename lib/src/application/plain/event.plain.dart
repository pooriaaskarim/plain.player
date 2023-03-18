import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/settings/model.settings.dart';

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
  factory PlainEvent.startApp() => const OnStartApp._();

  @override
  List<Object?> get props => [];
}

class OnAppLaunch extends PlainEvent {
  const OnAppLaunch._({
    required this.defaultSettings,
  });
  final Settings defaultSettings;
  @override
  List<Object> get props => [
        defaultSettings,
      ];
}

class OnLoadSettings extends PlainEvent {
  const OnLoadSettings._fromDb({
    required this.scaffoldMessengerState,
    this.dismissDatabase = false,
    this.settings,
  }) : assert(
          scaffoldMessengerState != null,
          'When using fromObject, scaffoldMessengerState cannot be null.',
        );
  const OnLoadSettings._fromObject({
    required this.settings,
    this.scaffoldMessengerState,
    this.dismissDatabase,
  }) : assert(
          settings != null,
          'When using fromObject, settings cannot be null.',
        );
  final Settings? settings;
  final ScaffoldMessengerState? scaffoldMessengerState;
  final bool? dismissDatabase;
  @override
  List<Object?> get props => [
        scaffoldMessengerState,
        dismissDatabase,
      ];
}

class OnLoadConfigurations extends PlainEvent {
  const OnLoadConfigurations._({
    this.dismissDatabase = false,
  });
  final bool dismissDatabase;
  @override
  List<Object?> get props => [
        dismissDatabase,
      ];
}

class OnStartApp extends PlainEvent {
  const OnStartApp._();
  @override
  List<Object?> get props => [];
}
