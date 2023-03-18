import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../../domain/settings/settings.model.dart';
import '../../domain/settings/theme_config.model.dart';
import '../exceptions/configuration.exceptions.dart';
import 'i.repository.local.dart';

class SettingsRepository implements LocalRepository {
  const SettingsRepository();
  @override
  @protected
  bool get isOpen => Isar.instanceNames.contains(instanceName);
  @override
  @protected
  final String instanceName = 'SettingsRepository';
  @override
  @protected
  final List<CollectionSchema> schemasList = const [SettingsSchema];

  @override
  @protected
  Future<Isar> get openDb async => isOpen
      ? Future.value(Isar.getInstance(instanceName))
      : Isar.open(
          [...schemasList],
          name: instanceName,
          inspector: true,
        );

  @override
  Future<void> get dismissDb async {
    if (isOpen) {
      await (await openDb).close();
    }
  }

  Future<Settings> read() async {
    final Isar db = await openDb;
    final Settings? appSetting = await db.txn(
      () => db.settings.get(1),
    );
    return (appSetting == null)
        ? throw AppNotConfiguredException()
        : appSetting;
  }

  Future<int> write(final Settings appSetting) async {
    final Isar db = await openDb;
    return db.writeTxn(() => db.settings.put(appSetting));
  }

  Future<void> update({
    final ThemeConfig? themeConfig,
  }) async {
    assert(themeConfig != null, 'At least on argument is required.');
    final Settings settings = await read();
    if (themeConfig != null) {
      settings.themeConfig = themeConfig;
    }
    await write(settings);
  }
}
