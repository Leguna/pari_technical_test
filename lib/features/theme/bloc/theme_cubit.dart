import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/data_source/local_database.dart';
import '../../../../main.dart';
import '../data/theme_datas.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState.initial());

  final themeKey = 'theme';
  final LocalDatabase localDatabase = getIt<LocalDatabase>();

  var currentTheme = darkTheme;

  void getTheme() async {
    final theme = await localDatabase.getString(themeKey, boxKey: themeKey);
    switch (theme) {
      case 'dark':
        currentTheme = darkTheme;
      case 'light':
        currentTheme = lightTheme;
      default:
        currentTheme = darkTheme;
    }
    emit(ThemeState.custom(themeData: currentTheme));
  }

  void changeTheme() {
    currentTheme = currentTheme == darkTheme ? lightTheme : darkTheme;
    localDatabase.setString(
      themeKey,
      currentTheme == darkTheme ? 'dark' : 'light',
      boxKey: themeKey,
    );
    emit(ThemeState.custom(themeData: currentTheme));
  }
}
