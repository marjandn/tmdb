import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';

import '../../components/shared_widgets.dart';
import 'bloc/movies_list_bloc.dart';
import 'widgets/movie_item_widget.dart';
import 'widgets/movies_list_widget.dart';

class MoviesListPage extends StatefulWidget {
  final String title;
  final MovieTypes movieType;
  const MoviesListPage({super.key, required this.title, required this.movieType});

  @override
  State<MoviesListPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  final ScrollController _scrollController = ScrollController();

  List<Movie> allMovies = [];

  @override
  void initState() {
    super.initState();
    _loadMore();

    _scrollController.addListener(() {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        _loadMore();
      }
    });
  }

  _loadMore() {
    switch (widget.movieType) {
      case MovieTypes.popular:
        context.read<MoviesListBloc>().add(const PopularMoviesRequestedEvent());
        break;
      default:
        context.read<MoviesListBloc>().add(const UpcomingMoviesRequestedEvent());
        break;
    }
  }

  @override
  void didChangeDependencies() {
    context.read<MoviesListBloc>().dispose();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(context: context, title: widget.title),
      body: Center(
        child: BlocBuilder<MoviesListBloc, MoviesListState>(
          buildWhen: (previous, current) =>
              current is MoviesFetchLoadingState ||
              current is MoviesFetchFailedState ||
              current is MoviesFetchSuccessState,
          builder: (context, state) {
            if (state is MoviesFetchSuccessState) {
              allMovies.addAll(state.movies);
              return MoviesListWidget(
                  scrollController: _scrollController,
                  showLazyLoading: state.showLazyLoading,
                  allMovies: allMovies);
            }
            return const CupertinoActivityIndicator();
          },
        ),
      ),
    );
  }
}
