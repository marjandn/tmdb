import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_upcoming_movies.dart';
import 'package:tmdb_prj/src/presentation/pages/genre/bloc/genre_bloc.dart';

import '../../../../domain/entities/movie.dart';

part 'movies_list_event.dart';
part 'movies_list_state.dart';

class MoviesListBloc extends Bloc<MoviesListEvent, MoviesListState> {
  final GetPopularMovies getPopularMovies;
  final GetUpcomingMovies getUpcomingMovies;

  int _totalPage = 1;
  int _currentPage = 0;

  void dispose() {
    _totalPage = 1;
    _currentPage = 0;
  }

  MoviesListBloc({
    required this.getPopularMovies,
    required this.getUpcomingMovies,
  }) : super(MoviesListInitial()) {
    on<PopularMoviesRequestedEvent>((event, emit) async {
      print("page is: $_currentPage");
      if (!_showLazyLoading()) return;

      Either<Failur, List<Movie>> movies =
          await getPopularMovies.call(PagingParam(page: ++_currentPage));

      movies.fold((left) => emit(const MoviesFetchFailedState()), (right) {
        _totalPage = right.first.totalPage ?? 1;
        emit(MoviesFetchSuccessState(movies: right, showLazyLoading: _showLazyLoading()));
      });
    });

    on<UpcomingMoviesRequestedEvent>((event, emit) async {
      if (!_showLazyLoading()) return;
      Either<Failur, List<Movie>> movies =
          await getUpcomingMovies.call(PagingParam(page: ++_currentPage));

      movies.fold((left) => emit(const MoviesFetchFailedState()), (right) {
        _totalPage = right.first.totalPage ?? 1;
        emit(MoviesFetchSuccessState(movies: right, showLazyLoading: _showLazyLoading()));
      });
    });
  }

  bool _showLazyLoading() => _currentPage < _totalPage;
}
