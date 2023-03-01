import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../views/widgets/gooshi.dart';

abstract class SplashScreenState extends Equatable {
  const SplashScreenState({
    this.logoWidget = const Gooshi(),
    this.loadingWidget = const SizedBox.shrink(),
  });
  final Gooshi logoWidget;
  final Widget loadingWidget;
  @override
  List<Object?> get props => [logoWidget, loadingWidget];
}

class InitialState extends SplashScreenState {
  const InitialState({
    super.logoWidget,
    super.loadingWidget,
  });
}

class LoadState extends SplashScreenState {
  const LoadState({
    super.logoWidget,
    super.loadingWidget,
  });
}

class SuccessState extends SplashScreenState {
  const SuccessState({
    super.logoWidget,
    super.loadingWidget,
  });
}

class ErrorState extends SplashScreenState {
  const ErrorState({
    super.logoWidget,
    super.loadingWidget,
  });
}
