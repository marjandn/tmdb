import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/config/themes/bloc/theme_bloc.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/presentation/pages/dashboard/dashboard_page.dart';

void main() {
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
      home: const DashboardPage(),
    );
  }
}

class TempPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => context.read<ThemeBloc>().add(ThemeChangePressed()),
              child: Text(
                "This is HeadLine 1",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Text(
              "This is HeadLine 6",
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              "This is Display Large",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              "This is Display Small",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              "This is Body Large",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "This is Body Medium",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "This is Sub Title 1",
              style:
                  Theme.of(context).textTheme.subtitle1?.apply(color: context.appTheme.focusColor),
            ),
            Text(
              "This is Sub Title 2",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              "This is Title Large",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "This is Title Medium",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
