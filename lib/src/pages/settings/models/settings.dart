import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 0)
class Settings extends HiveObject {
  Settings({
    required this.themeMode,
  });
  @HiveField(0)
  ThemeMode themeMode;
}
