import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SplashScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnInit extends SplashScreenEvent {
  @override
  List<Object?> get props => [];
}

class OnLoad extends SplashScreenEvent {
  @override
  List<Object?> get props => [];
}

class OnSuccess extends SplashScreenEvent {
  OnSuccess({
    required this.themeData,
  });
  final ThemeData themeData;
  @override
  List<Object?> get props => [
        themeData,
      ];
}

class OnError extends SplashScreenEvent {
  OnError({required this.error});
  final String error;

  @override
  List<Object> get props => [
        error,
      ];
}
