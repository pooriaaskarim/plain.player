import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/configuration/model.configurations.dart';
import '../../domain/settings/settings.model.dart';

abstract class SplashState extends Equatable {
  /// A [widget] Widget?  can be provided to show on
  /// SplashScreen.
  const SplashState({
    this.widget,
  });
  factory SplashState.initial({final Widget? widget}) => AppLaunchState._(
        widget: widget,
      );
  factory SplashState.loading({
    final Configurations? loadedConfigurations,
    final Settings? loadedSettings,
    final Widget? widget,
  }) =>
      LoadingState._(
        loadedConfigurations: loadedConfigurations,
        loadedSettings: loadedSettings,
        widget: widget,
      );
  factory SplashState.success({final Widget? widget}) => SuccessState._(
        widget: widget,
      );

  factory SplashState.error({final Widget? widget}) =>
      ErrorState._(widget: widget);

  /// Current [SplashState]'s [widget].
  final Widget? widget;

  @override
  List<Object?> get props => [
        widget,
      ];
}

class AppLaunchState extends SplashState {
  const AppLaunchState._({
    super.widget,
  });
  @override
  List<Object?> get props => [
        widget,
      ];
}

class LoadingState extends SplashState {
  const LoadingState._({
    this.loadedConfigurations,
    this.loadedSettings,
    super.widget,
  });

  /// if could read a theme, it would fill this object.
  final Settings? loadedSettings;

  /// if could read a configuration, it would fill this object.
  final Configurations? loadedConfigurations;
  @override
  List<Object?> get props => [
        loadedConfigurations,
        loadedSettings,
        widget,
      ];
}

class SuccessState extends SplashState {
  const SuccessState._({
    super.widget,
  });
  @override
  List<Object?> get props => [
        widget,
      ];
}

class ErrorState extends SplashState {
  const ErrorState._({
    super.widget,
  });
  @override
  List<Object?> get props => [
        widget,
      ];
}
