import 'package:isar/isar.dart';

import '../../../domain/settings/app_setting.model.dart';

class StorageService {
  ///[StorageService] is a SINGLETON which provides an interface to
  /// [Isar] Storage.

  StorageService._() {
    db = openDB();
  }
  factory StorageService() => _instance;
  static final StorageService _instance = StorageService._();
  late Future<Isar> db;

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return Isar.open(
        [
          AppSettingSchema,
        ],
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
}
