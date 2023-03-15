import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object?> get props => [];
}

class OnInit extends SplashEvent {
  ///   Provider the event with an initial [themeMode] default app theme.
  const OnInit({required this.themeMode});

  ///   Initial app theme
  final ThemeMode themeMode;
  @override
  List<Object?> get props => [
        themeMode,
      ];
}

class OnLoad extends SplashEvent {
  /// Loads settings configurations from local storage
  /// or set's defaults on the first run.
  const OnLoad();
  @override
  List<Object?> get props => [];
}

class OnSuccess extends SplashEvent {
  /// Load's the app with retrieved settings configurations
  /// and launches the app.
  const OnSuccess({
    required this.themeMode,
  });

  /// App Configurations: currently only theme is available!!!
  final ThemeMode themeMode;
  @override
  List<Object?> get props => [
        themeMode,
      ];
}

class OnError extends SplashEvent {
  /// Shows [errorMessage] as tooltip on the errorState's stateWidget.
  const OnError({
    required this.errorMessage,
  });

  /// Tooltip message on the errorState's stateWidget.
  final String errorMessage;

  @override
  List<Object> get props => [];
}
