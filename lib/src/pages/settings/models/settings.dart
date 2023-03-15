import 'package:isar/isar.dart';

import 'theme_config.dart';

part 'settings.g.dart';

@Collection()
class Settings {
  Settings({
    required this.themeConfig,
  });
  final Id id = 1;

  Settings copyWith({final ThemeConfig? themeConfig}) =>
      this..themeConfig = themeConfig ?? this.themeConfig;
  ThemeConfig themeConfig;
}
