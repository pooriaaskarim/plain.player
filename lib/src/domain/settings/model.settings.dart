import 'package:isar/isar.dart';

import 'model.theme_config.dart';

part 'model.settings.g.dart';

@Collection()
class Settings {
  Settings({
    required this.themeConfig,
  });
  factory Settings.defaultSettings() =>
      Settings(themeConfig: ThemeConfig.defaultThemeConfig());
  final Id id = 1; //Do not change this.

  ThemeConfig themeConfig;
}
