import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_prj/src/app/config/themes/bloc/theme_bloc.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/di/di.dart';
import 'package:tmdb_prj/src/domain/entities/movie_details.dart';
import 'package:tmdb_prj/src/presentation/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/dashboard/dashboard_page.dart';
import 'package:tmdb_prj/src/presentation/pages/movie/movie_details_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupAllLocators();

  runApp(BlocProvider(
    create: (context) => ThemeBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.theme,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DashboardBloc(),
          ),
        ],
        child: const DashboardPage(),
      ),
    );
  }
}
