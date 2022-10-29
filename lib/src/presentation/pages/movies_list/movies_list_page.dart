import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';

import '../../components/shared_widgets.dart';
import 'bloc/movies_list_bloc.dart';
import 'widgets/movie_item_widget.dart';

class MoviesListPage extends StatefulWidget {
  final String title;
  final MovieTypes movieType;
  const MoviesListPage({super.key, required this.title, required this.movieType});

  @override
  State<MoviesListPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = true;
  int _totalPage = 1;
  List<Movie> allMovies = [];
  int _currentPage = 0;

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
    if (_currentPage < _totalPage) {
      _isLoading = true;
      switch (widget.movieType) {
        case MovieTypes.popular:
          context.read<MoviesListBloc>().add(PopularMoviesRequestedEvent(page: ++_currentPage));
          break;
        default:
          context.read<MoviesListBloc>().add(UpcomingMoviesRequestedEvent(page: ++_currentPage));
          break;
      }
    } else {
      _isLoading = false;
    }
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
              _totalPage = state.movies.first.totalPage ?? 1;
              return ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.only(top: 32),
                itemCount: _isLoading ? allMovies.length + 1 : allMovies.length,
                itemBuilder: (context, index) => (index < allMovies.length)
                    ? MovieItemWidget(movie: allMovies[index])
                    : (_isLoading)
                        ? const CupertinoActivityIndicator()
                        : const SizedBox(),
              );
            }
            return const CupertinoActivityIndicator();
          },
        ),
      ),
    );
  }
}
