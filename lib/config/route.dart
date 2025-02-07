import 'package:go_router/go_router.dart';

import '../presentation/screens/detail_screen.dart';
import '../presentation/screens/home_screen.dart';

const String appTitle = 'Technical Test Ahmad Tuflihun';
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
