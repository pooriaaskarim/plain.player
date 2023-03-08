import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/splash_screen_status.dart';
import '../views/splash_screen.dart';

abstract class SplashScreenState extends Equatable {
  /// Every [SplashScreenState] has a [themeData] to theme the [SplashScreen].
  /// A [statusWidget] Widget? along with a [statusWidgetTooltip] String? can
  /// be provided to show above the logo on [SplashScreen].
  /// The getter [status] return [SplashScreenStatus] at any given moment.
  const SplashScreenState({
    required this.themeData,
    this.statusWidget,
    this.statusWidgetTooltip,
  });

  /// Current [SplashScreenState]'s [themeData]
  final ThemeData themeData;

  /// Current [SplashScreenState]'s [statusWidget]
  final Widget? statusWidget;

  /// Current [SplashScreenState]'s
  final String? statusWidgetTooltip;
  @override
  List<Object?> get props => [
        themeData,
        statusWidget,
      ];
}

class InitialState extends SplashScreenState {
  const InitialState({
    required super.themeData,
    super.statusWidget,
    super.statusWidgetTooltip,
  });
  @override
  List<Object?> get props => [
        themeData,
        statusWidget,
      ];
}

class LoadState extends SplashScreenState {
  const LoadState({
    required super.themeData,
    super.statusWidget,
    super.statusWidgetTooltip,
  });
  @override
  List<Object?> get props => [
        themeData,
        statusWidget,
      ];
}

class SuccessState extends SplashScreenState {
  const SuccessState({
    required super.themeData,
    super.statusWidget,
    super.statusWidgetTooltip,
  });
  @override
  List<Object?> get props => [
        themeData,
        statusWidget,
      ];
}

class ErrorState extends SplashScreenState {
  const ErrorState({
    required super.themeData,
    required super.statusWidget,
    required super.statusWidgetTooltip,
  });
  @override
  List<Object?> get props => [
        themeData,
        statusWidget,
      ];
}
