import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pari_technical_test/features/theme/data/theme_datas.dart';

import '../config/route.dart';
import '../domain/bloc/item_cubit.dart';
import '../features/theme/bloc/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ItemCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: appTitle,
            debugShowCheckedModeBanner: false,
            theme: state.maybeWhen(
              orElse: () => darkTheme,
              custom: (themeData) => themeData,
            ),
            routerConfig: router,
          );
        },
      ),
    );
  }
}
