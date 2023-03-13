import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../pages/settings/models/settings.dart';

class StorageService {
  ///[StorageService] is a SINGLETON which provides an interface to
  /// [Hive] Storage box [_plainBox].
  /// *** Initialize [StorageService] through async getter
  /// [StorageService.init] in Main Process before running app.
  StorageService._();
  factory StorageService.instance() => _instance;
  static final StorageService _instance = StorageService._();

  Future<void> get init async => Hive
    ..init(
      await _storagePath,
      backendPreference: HiveStorageBackendPreference.native,
    )
    ..registerAdapter(SettingsAdapter());

  Future<void> get dismiss async => Hive.close();

  Future<String> get _storagePath async =>
      '${await getApplicationDocumentsDirectory().then((final value) => value.path)}/.data';

  static const String _plainBox = 'Plain.Box';

  Future<Box> get _openBox => Hive.openBox(_plainBox);
  Future<void> get _closeBox => Hive.box(_plainBox).close();

  Future<int> add<T>({
    required final T value,
  }) async {
    final int index = await (await _openBox).add(value);
    await _closeBox;
    return index;
  }

  Future<Iterable<int>> addAll<T>({
    required final Iterable<T> entries,
  }) async {
    final Iterable<int> indexes = await (await _openBox).addAll(entries);
    await _closeBox;
    return indexes;
  }

  Future<void> put<T>({
    required final String key,
    required final T value,
  }) async {
    await (await _openBox).put(key, value);
    await _closeBox;
  }

  Future<void> putAll<T>({required final Map<String, T> entries}) async {
    await (await _openBox).putAll(entries);
    await _closeBox;
  }

  Future<void> putAt<T>({
    required final int index,
    required final T value,
  }) async {
    await (await _openBox).putAt(index, value);
    await _closeBox;
  }

  Future<T> get<T>({
    required final String key,
  }) async {
    final T value = await (await _openBox).get(key);
    await _closeBox;
    return value;
  }

  Future<T> getAt<T>({
    required final int index,
  }) async {
    final T value = await (await _openBox).getAt(index);
    await _closeBox;
    return value;
  }

  Future<int> clear() async {
    final int entries = await (await _openBox).clear();
    await _closeBox;
    return entries;
  }

  Future<void> delete(final String boxName, {required final String key}) async {
    await (await _openBox).delete(key);
    await _closeBox;
  }

  Future<void> deleteAll(
    final String boxName, {
    required final List<String> keys,
  }) async {
    await (await _openBox).deleteAll(keys);
    await _closeBox;
  }
}
