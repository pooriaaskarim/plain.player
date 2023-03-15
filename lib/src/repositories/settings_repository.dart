import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../domain/settings/app_setting.model.dart';
import '../domain/settings/theme_config.model.dart';
import '../infrastructure/exceptions/configuration.exceptions.dart';
import '../infrastructure/services/storage/storage_service.dart';

class SettingsRepository {
  Future<AppSetting> get read async {
    final Isar db = await StorageService().db;
    final AppSetting? appSetting = await db.txn(
      () => db.appSettings.get(1),
    );
    return (appSetting == null)
        ? throw AppNotConfiguredException()
        : appSetting;
  }

  Future<int> write(final AppSetting appSetting) async {
    final Isar db = await StorageService().db;
    debugPrint(db.path);
    return db.writeTxn(() => db.appSettings.put(appSetting));
  }

  Future<void> update({
    final ThemeConfig? themeConfig,
  }) async {
    assert(themeConfig != null, 'At least on argument is required.');
    final AppSetting settings = await read;
    if (themeConfig != null) {
      settings.themeConfig = themeConfig;
    }
    await write(settings);
  }
}
