import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SplashState extends Equatable {
  /// Every [SplashState] has a [themeMode] to theme the [SplashScreen].
  /// A [stateWidget] Widget?  can be provided to show above the logo on
  /// [SplashScreen].
  /// The getter [status] return [SplashScreenStatus] at any given moment.

  const SplashState({
    required this.themeMode,
    this.stateWidget,
  });

  /// Current [SplashState]'s [themeMode]
  final ThemeMode themeMode;

  /// Current [SplashState]'s [stateWidget]
  final Widget? stateWidget;

  @override
  List<Object?> get props => [
        themeMode,
        stateWidget,
      ];
}

class InitialState extends SplashState {
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

class LoadingState extends SplashState {
  const LoadingState({
    required super.themeMode,
    super.stateWidget,
  });
  @override
  List<Object?> get props => [
        themeMode,
        stateWidget,
      ];
}

class SuccessState extends SplashState {
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

class ErrorState extends SplashState {
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
