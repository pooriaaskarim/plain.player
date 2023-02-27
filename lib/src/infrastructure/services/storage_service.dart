import 'package:hive/hive.dart';

class AppStorageService {
  static final Future<Box> storage = Hive.openBox(
    'commaStorage',
    path: './.data',
  );

  static Future<void> put<T>({required String key, required T value}) async {
    return (await storage).put(key, value);
  }

  static Future<T> get<T>({
    required String key,
  }) async {
    return (await storage).get(key);
  }

  static Future<int> clear() async {
    return (await storage).clear();
  }

  static Future<void> delete({required String key}) async {
    return (await storage).delete(key);
  }

  static Future<void> deleteAll({required List<String> key}) async {
    return (await storage).deleteAll(key);
  }
}
