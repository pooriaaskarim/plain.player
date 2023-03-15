import 'package:isar/isar.dart';

import 'theme_config.model.dart';

part 'app_setting.model.g.dart';

@Collection()
class AppSetting {
  AppSetting({
    required this.themeConfig,
  });
  final Id id = 1; //Do not change this.

  ThemeConfig themeConfig;
}
