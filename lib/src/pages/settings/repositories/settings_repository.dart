import 'package:isar/isar.dart';

import '../../../infrastructure/exceptions/configuration.exceptions.dart';
import '../../../infrastructure/services/storage/storage_service.dart';
import '../bloc/settings_bloc.dart';
import '../models/settings.dart';
import '../models/theme_config.dart';

class SettingsRepository {
  SettingsRepository();
  Future<IsarCollection<Settings>> get open async =>
      (await Isar.open([SettingsSchema])).settings;
  Future<void> get close async => (await Isar.open([SettingsSchema])).close();

  Future<Settings> get read async {
    final Isar isar = await StorageService().db;
    final Settings? settings = await isar.txn(
      () => isar.settings.get(1),
    );
    return (settings == null) ? throw AppNotConfiguredException() : settings;
  }

  Future<int> write(final Settings settings) async {
    final Isar isar = await StorageService().db;
    return isar.writeTxn(() => isar.settings.put(settings));
  }

  Future<void> update({
    final ThemeConfig? themeConfig,
  }) async {
    assert(themeConfig != null, 'At least on argument is required.');
    final Settings settings = await read;
    if (themeConfig != null) {
      settings.themeConfig = themeConfig;
    }
    await write(settings);
  }

  Future<void> resetSettings() async {
    await write(SettingsBloc.defaultSettings);
  }
}
