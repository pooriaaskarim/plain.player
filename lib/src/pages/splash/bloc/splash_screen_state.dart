import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../views/splash_screen.dart';

abstract class SplashScreenState extends Equatable {
  /// Every [SplashScreenState] has a [themeData] to theme the [SplashScreen]
  /// and a [statusWidget] \[which default's to [SizedBox.shrink()]\] to
  /// be built on [SplashScreen].
  const SplashScreenState({
    required this.themeData,
    required this.statusWidget,
  });

  /// Current [SplashScreenState]'s theme
  final ThemeData themeData;

  /// Current [SplashScreenState]'s [statusWidget]
  final Widget statusWidget;

  @override
  List<Object?> get props => [
        themeData,
        statusWidget,
      ];
}

class InitialState extends SplashScreenState {
  const InitialState({
    required super.themeData,
    required super.statusWidget,
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
    required super.statusWidget,
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
    required super.statusWidget,
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
  });
  @override
  List<Object?> get props => [
        themeData,
        statusWidget,
      ];
}
