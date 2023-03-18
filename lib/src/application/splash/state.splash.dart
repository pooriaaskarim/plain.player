import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
    final Widget? widget,
  }) =>
      LoadingState._(
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
    super.widget,
  });

  @override
  List<Object?> get props => [
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
