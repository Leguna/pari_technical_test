
import 'package:hive_flutter/hive_flutter.dart';

const String mainBox = 'local_database';

class LocalDatabase {
  init() {
    Hive.initFlutter();
    return this;
  }

  Future<String?> getString(String key, {String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    return box.get(key) as String?;
  }

  Future<Box> getBox(String boxKey) async {
    final box = await Hive.openBox(boxKey);
    return box;
  }

  Future<void> setString(String key, String? value,
      {String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    await box.put(key, value);
  }

  Future<int?> getInt(String key, {String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    return box.get(key) as int?;
  }

  Future<void> setInt(String key, int? value, {String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    await box.put(key, value);
  }

  Future<bool?> getBool(
    String key, {
    String boxKey = mainBox,
  }) async {
    final box = await Hive.openBox(boxKey);
    return (box.get(key)) as bool?;
  }

  Future<void> setBool(
    String key,
    bool? value, {
    String boxKey = mainBox,
  }) async {
    final box = await Hive.openBox(boxKey);
    await box.put(key, value);
  }

  Future<double?> getDouble(String key, {String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    return box.get(key) as double?;
  }

  Future<void> setDouble(String key, double? value,
      {String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    await box.put(key, value);
  }

  Future<void> clearKey(String key, {String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    await box.delete(key);
  }

  Future<void> clearBox({String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    await box.clear();
  }

  Future<dynamic> getKeys({String boxKey = mainBox}) async {
    final box = await Hive.openBox(boxKey);
    return box.keys;
  }
}
