import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'state.error.dart';
part 'state.initial.dart';
part 'state.loading.dart';
part 'state.success.dart';

abstract class SplashState extends Equatable {
  /// A [widget] Widget?  can be provided to show on
  /// SplashScreen.
  const SplashState({
    this.widget,
  });
  factory SplashState.initial({final Widget? widget}) => InitialState._(
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
