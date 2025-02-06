import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pari_technical_test/data/data_source/local_database.dart';
import 'package:pari_technical_test/presentation/screens/detail_screen.dart';

import 'data/data_source/item_repository.dart';
import 'domain/bloc/item_cubit.dart';
import 'presentation/screens/home_screen.dart';

final getIt = GetIt.instance;
const String appTitle = 'PARI Technical Test Ahmad Tuflihun';
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(title: appTitle),
    ),
    GoRoute(
        path: detailPath(':id'),
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '1';
          return DetailScreen(id: id);
        }),
  ],
);

String detailPath(String id) => '/detail/$id';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingletonAsync<LocalDatabase>(
    () async => await LocalDatabase().init(),
  );
  getIt.registerSingleton<ItemRepository>(ItemRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ItemCubit()),
      ],
      child: MaterialApp.router(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
