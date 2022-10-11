import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/config/themes/bloc/theme_bloc.dart';
import 'package:tmdb_prj/src/app/config/themes/themes.dart';

extension ThemeExtension on BuildContext {
  ThemeData get appTheme => Theme.of(this);

  ThemeData get theme => (watch<ThemeBloc>().state is LightThemeState)
      ? ThemesManager.light().getTheme()
      : ThemesManager.dark().getTheme();
}
