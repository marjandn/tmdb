import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'package:tmdb_prj/main.dart';
import 'package:tmdb_prj/src/app/config/themes/bloc/theme_bloc.dart';
import 'package:tmdb_prj/src/di/di.dart';
import 'package:tmdb_prj/src/presentation/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/genre/bloc/genre_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/home/bloc/home_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/search/bloc/search_bloc.dart';

import 'widget_test.mocks.dart';

@GenerateNiceMocks([MockSpec<HomeBloc>(), MockSpec<SearchBloc>(), MockSpec<GenreBloc>()])
void main() {
  LiveTestWidgetsFlutterBinding();

  setUpAll(() {
    performFakeInjections();
  });
  testWidgets('Home tab show at first time', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(BlocProvider(
      create: (_) => injector<ThemeBloc>(),
      child: const MyApp(),
    ));

    expect(find.text("Upcoming Movies"), findsOneWidget);

    var themeIcon = find.byIcon(Icons.nightlight_round);
    expect(themeIcon, findsOneWidget);

    await tester.tap(themeIcon);
    await tester.pump();
    await tester.pump();

    expect(themeIcon, findsNothing);
    expect(find.byIcon(Icons.sunny), findsOneWidget);
  });
}

void performFakeInjections() {
  injector.registerSingleton<ThemeBloc>(ThemeBloc());
  injector.registerSingleton<DashboardBloc>(DashboardBloc());
  injector.registerSingleton<HomeBloc>(MockHomeBloc());
  injector.registerSingleton<SearchBloc>(MockSearchBloc());
  injector.registerSingleton<GenreBloc>(MockGenreBloc());
}
