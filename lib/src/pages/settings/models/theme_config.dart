import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'theme_config.g.dart';

@Embedded()
@Name('ThemeConfig')
class ThemeConfig {
  const ThemeConfig({this.themeMode = ThemeMode.light});
  @Name('ThemeMode')
  @Enumerated(EnumType.name, 'ThemeMode')
  final ThemeMode themeMode;
}
