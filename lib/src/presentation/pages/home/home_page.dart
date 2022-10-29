import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/di/di.dart';
import 'package:tmdb_prj/src/presentation/pages/home/bloc/home_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/home/widgets/popular_tvshows_list_widget.dart';
import 'package:tmdb_prj/src/presentation/pages/movies_list/movies_list_page.dart';
import 'package:tmdb_prj/src/presentation/pages/people_list/bloc/people_list_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/people_list/people_list_page.dart';
import 'package:tmdb_prj/src/presentation/pages/tvshow_list/bloc/tvshow_list_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/tvshow_list/tvshow_list_page.dart';

import '../movies_list/bloc/movies_list_bloc.dart';
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const SizedBox(
            height: 16,
          ),
          ListHeaderWidget(
            headerTitle: "Today Popular Movies",
            seeAllCallback: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider<MoviesListBloc>.value(
                value: injector<MoviesListBloc>(),
                child: const MoviesListPage(title: "Popular Movies", movieType: MovieTypes.popular),
              ),
            )),
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(height: 300, child: PopularMoviesListWidget()),
          const SizedBox(
            height: 32,
          ),
          ListHeaderWidget(
            headerTitle: "Upcoming Movies",
            seeAllCallback: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider<MoviesListBloc>.value(
                value: injector<MoviesListBloc>(),
                child:
                    const MoviesListPage(title: "Upcoming Movies", movieType: MovieTypes.upcoming),
              ),
            )),
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(height: 300, child: UpcomingMoviesListWidget()),
          const SizedBox(
            height: 32,
          ),
          ListHeaderWidget(
            headerTitle: "Popular Persons",
            seeAllCallback: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider<PeopleListBloc>.value(
                value: injector<PeopleListBloc>(),
                child: const PeopleListPage(title: "Popular Persons"),
              ),
            )),
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(height: 200, child: PopularPeopleListWidget()),
          const SizedBox(
            height: 32,
          ),
          ListHeaderWidget(
            headerTitle: "Featured Tv Shows",
            seeAllCallback: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider<TvshowListBloc>.value(
                value: injector<TvshowListBloc>(),
                child: const TvShowListPage(
                    title: "Featured Tv Shows", tvshowType: TvshowTypes.featured),
              ),
            )),
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(height: 300, child: FeaturedTvShowsListWidget()),
          const SizedBox(
            height: 32,
          ),
          ListHeaderWidget(
            headerTitle: "Popular Tv Shows",
            seeAllCallback: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider<TvshowListBloc>.value(
                value: injector<TvshowListBloc>(),
                child: const TvShowListPage(
                    title: "Popular Tv Shows", tvshowType: TvshowTypes.popular),
              ),
            )),
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(height: 300, child: PopularTvShowsListWidget()),
          const SizedBox(
            height: 32,
          ),
        ]),
      ),
    );
  }
}
