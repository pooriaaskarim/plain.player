import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SplashScreenEvent extends Equatable {
  const SplashScreenEvent();

  @override
  List<Object?> get props => [];
}

class OnInit extends SplashScreenEvent {
  ///   Provider the event with an initial [themeData] default app theme.
  const OnInit({required this.themeData});

  ///   Initial app theme
  final ThemeData themeData;
  @override
  List<Object?> get props => [
        themeData,
      ];
}

class OnLoad extends SplashScreenEvent {
  /// Loads settings configurations from local storage
  /// or set's defaults on the first run.
  const OnLoad();
  @override
  List<Object?> get props => [];
}

class OnSuccess extends SplashScreenEvent {
  /// Load's the app with retrieved settings configurations
  /// and launches the app.
  const OnSuccess({
    required this.themeData,
  });

  /// App Configurations: currently only theme is available!!!
  final ThemeData themeData;
  @override
  List<Object?> get props => [
        themeData,
      ];
}

class OnError extends SplashScreenEvent {
  /// Shows [errorTooltip] as tooltip on the errorState's stateWidget.
  const OnError({
    required this.errorTooltip,
  });

  /// Tooltip message on the errorState's stateWidget.
  final String errorTooltip;

  @override
  List<Object> get props => [
        errorTooltip,
      ];
}
