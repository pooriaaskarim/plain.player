import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.themeMode});
  final ThemeMode themeMode;
  @override
  List<Object?> get props => [themeMode];
}
