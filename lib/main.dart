import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/config/themes/bloc/theme_bloc.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/di/di.dart';
import 'package:tmdb_prj/src/presentation/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/dashboard/dashboard_page.dart';

void main() async {
  await setupServiceLocator();
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
      home: BlocProvider(
        create: (context) => DashboardBloc(),
        child: const DashboardPage(),
      ),
    );
  }
}
