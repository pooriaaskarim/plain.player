import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'model.theme_config.g.dart';

@Embedded()
class ThemeConfig {
  ThemeConfig({this.themeMode = ThemeMode.light});
  factory ThemeConfig.defaultThemeConfig() => ThemeConfig();
  @Enumerated(
    EnumType.name,
  )
  ThemeMode themeMode;
}
