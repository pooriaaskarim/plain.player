import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'theme_config.model.g.dart';

@Embedded()
class ThemeConfig {
  ThemeConfig({this.themeMode = ThemeMode.light});
  factory ThemeConfig.defaults() => ThemeConfig();
  @Enumerated(
    EnumType.name,
  )
  ThemeMode themeMode;
}
