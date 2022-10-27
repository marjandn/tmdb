import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/presentation/pages/home/bloc/home_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/home/widgets/popular_tvshows_list_widget.dart';

import 'widgets/featured_tvshows_list_widget.dart';
import 'widgets/popular_people_list_widget.dart';
import 'widgets/list_heaeder_widget.dart';
import 'widgets/popular_movies_list_widget.dart';
import 'widgets/upcoming_movies_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const PopularMoviesFetchRequestedEvent());
    context.read<HomeBloc>().add(const FeaturedMoviesFetchRequestedEvent());
    context.read<HomeBloc>().add(const UpcomingMoviesFetchRequestedEvent());
    context.read<HomeBloc>().add(const PopularTvShowsFetchRequestedEvent());
    context.read<HomeBloc>().add(const FeaturedTvShowsFetchRequestedEvent());
    context.read<HomeBloc>().add(const PopularPeopleFetchRequestEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.appTheme.primaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings_rounded,
            color: context.appTheme.focusColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: const [
          SizedBox(
            height: 16,
          ),
          ListHeaderWidget(
            headerTitle: "Today Popular Movies",
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(height: 300, child: PopularMoviesListWidget()),
          SizedBox(
            height: 32,
          ),
          ListHeaderWidget(
            headerTitle: "Upcoming Movies",
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(height: 300, child: UpcomingMoviesListWidget()),
          SizedBox(
            height: 32,
          ),
          ListHeaderWidget(headerTitle: "Popular Persons"),
          SizedBox(
            height: 8,
          ),
          SizedBox(height: 200, child: PopularPeopleListWidget()),
          SizedBox(
            height: 32,
          ),
          ListHeaderWidget(
            headerTitle: "Featured Tv Shows",
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(height: 300, child: FeaturedTvShowsListWidget()),
          SizedBox(
            height: 32,
          ),
          ListHeaderWidget(
            headerTitle: "Popular Tv Shows",
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(height: 300, child: PopularTvShowsListWidget()),
          SizedBox(
            height: 32,
          ),
        ]),
      ),
    );
  }
}
