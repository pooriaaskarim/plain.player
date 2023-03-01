import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AppStorageService {
  static Future<Box> get storage async => Hive.openBox(
        'commaStorage',
        path:
            '${await getApplicationDocumentsDirectory().then((final value) => value.path)}/.data',
      );

  static Future<void> put<T>({
    required final String key,
    required final T value,
  }) async =>
      (await storage).put(key, value);

  static Future<T> get<T>({
    required final String key,
  }) async =>
      (await storage).get(key);

  static Future<int> clear() async => (await storage).clear();

  static Future<void> delete({required final String key}) async =>
      (await storage).delete(key);

  static Future<void> deleteAll({required final List<String> key}) async =>
      (await storage).deleteAll(key);
}
