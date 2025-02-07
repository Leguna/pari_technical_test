import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pari_technical_test/data/data_source/local_database.dart';

import 'data/data_source/item_repository.dart';
import 'presentation/my_app.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await LocalDatabase().init();
  getIt.registerSingleton<LocalDatabase>(db);
  getIt.registerSingleton(ItemRepository());
  runApp(const MyApp());
}
