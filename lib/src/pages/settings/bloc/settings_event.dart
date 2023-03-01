import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
  @override
  List<Object> get props => [];
}

class OnLoadSettings extends SettingsEvent {
  const OnLoadSettings({required this.themeData});
  final ThemeData themeData;
  @override
  List<Object> get props => [
        themeData,
      ];
}

class OnToggleTheme extends SettingsEvent {}
