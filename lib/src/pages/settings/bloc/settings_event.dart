import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
  @override
  List<Object> get props => [];
}

class OnLoadSettings extends SettingsEvent {
  const OnLoadSettings({required this.themeMode});
  final ThemeMode themeMode;
  @override
  List<Object> get props => [
        themeMode,
      ];
}

class OnToggleTheme extends SettingsEvent {}
