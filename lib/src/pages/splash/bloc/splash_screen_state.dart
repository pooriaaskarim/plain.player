import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/splash_screen_status.dart';
import '../views/splash_screen.dart';

abstract class SplashScreenState extends Equatable {
  /// Every [SplashScreenState] has a [themeData] to theme the [SplashScreen].
  /// A [stateWidget] Widget?  can be provided to show above the logo on
  /// [SplashScreen].
  /// The getter [status] return [SplashScreenStatus] at any given moment.

  const SplashScreenState({
    required this.themeData,
    this.stateWidget,
  });

  /// Current [SplashScreenState]'s [themeData]
  final ThemeData themeData;

  /// Current [SplashScreenState]'s [stateWidget]
  final Widget? stateWidget;

  @override
  List<Object?> get props => [
        themeData,
        stateWidget,
      ];
}

class InitialState extends SplashScreenState {
  const InitialState({
    required super.themeData,
    super.stateWidget,
  });
  @override
  List<Object?> get props => [
        themeData,
        stateWidget,
      ];
}

class LoadState extends SplashScreenState {
  const LoadState({
    required super.themeData,
    super.stateWidget,
  });
  @override
  List<Object?> get props => [
        themeData,
        stateWidget,
      ];
}

class SuccessState extends SplashScreenState {
  const SuccessState({
    required super.themeData,
    super.stateWidget,
  });
  @override
  List<Object?> get props => [
        themeData,
        stateWidget,
      ];
}

class ErrorState extends SplashScreenState {
  const ErrorState({
    required super.themeData,
    required super.stateWidget,
  });
  @override
  List<Object?> get props => [
        themeData,
        stateWidget,
      ];
}
