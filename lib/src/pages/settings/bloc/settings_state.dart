import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.themeData});
  final ThemeData themeData;
  @override
  List<Object?> get props => [themeData];
}
