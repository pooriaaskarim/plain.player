import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingsState extends Equatable {
  final ThemeData themeData;
  const SettingsState({required this.themeData});
  @override
  List<Object?> get props => [themeData];
}
