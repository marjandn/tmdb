import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/di/di.dart';
import 'package:tmdb_prj/src/presentation/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/genre/bloc/genre_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/genre/genre_page.dart';
import 'package:tmdb_prj/src/presentation/pages/home/bloc/home_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/home/home_page.dart';
import 'package:tmdb_prj/src/presentation/pages/search/bloc/search_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/search/search_page.dart';

import 'widgets/bottom_navigation_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashboardBloc, DashboardState>(builder: (context, state) {
        if (state is GenreSelectedState) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<GenreBloc>.value(
                value: injector<GenreBloc>(),
              ),
            ],
            child: const GenrePage(),
          );
        }
        if (state is SearchSelectedState) {
          return BlocProvider<SearchBloc>.value(
            value: injector<SearchBloc>(),
            child: const SearchPage(),
          );
        }
        return BlocProvider<HomeBloc>.value(
          value: injector<HomeBloc>(),
          child: const HomePage(),
        );
      }),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
