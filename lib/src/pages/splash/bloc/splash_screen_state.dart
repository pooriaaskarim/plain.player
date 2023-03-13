import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/splash_screen_status.dart';
import '../views/splash_screen.dart';

abstract class SplashScreenState extends Equatable {
  /// Every [SplashScreenState] has a [themeMode] to theme the [SplashScreen].
  /// A [stateWidget] Widget?  can be provided to show above the logo on
  /// [SplashScreen].
  /// The getter [status] return [SplashScreenStatus] at any given moment.

  const SplashScreenState({
    required this.themeMode,
    this.stateWidget,
  });

  /// Current [SplashScreenState]'s [themeMode]
  final ThemeMode themeMode;

  /// Current [SplashScreenState]'s [stateWidget]
  final Widget? stateWidget;

  @override
  List<Object?> get props => [
        themeMode,
        stateWidget,
      ];
}

class InitialState extends SplashScreenState {
  const InitialState({
    required super.themeMode,
    super.stateWidget,
  });
  @override
  List<Object?> get props => [
        themeMode,
        stateWidget,
      ];
}

class LoadState extends SplashScreenState {
  const LoadState({
    required super.themeMode,
    super.stateWidget,
  });
  @override
  List<Object?> get props => [
        themeMode,
        stateWidget,
      ];
}

class SuccessState extends SplashScreenState {
  const SuccessState({
    required super.themeMode,
    super.stateWidget,
  });
  @override
  List<Object?> get props => [
        themeMode,
        stateWidget,
      ];
}

class ErrorState extends SplashScreenState {
  const ErrorState({
    required super.themeMode,
    required super.stateWidget,
  });
  @override
  List<Object?> get props => [
        themeMode,
        stateWidget,
      ];
}
