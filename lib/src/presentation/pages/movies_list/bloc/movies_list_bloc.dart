import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/usercases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usercases/movie/get_upcoming_movies.dart';

import '../../../../domain/entities/movie.dart';

part 'movies_list_event.dart';
part 'movies_list_state.dart';

class MoviesListBloc extends Bloc<MoviesListEvent, MoviesListState> {
  final GetPopularMovies getPopularMovies;
  final GetUpcomingMovies getUpcomingMovies;

  MoviesListBloc({
    required this.getPopularMovies,
    required this.getUpcomingMovies,
  }) : super(MoviesListInitial()) {
    on<PopularMoviesRequestedEvent>((event, emit) async {
      Either<Failur, List<Movie>> movies =
          await getPopularMovies.call(PagingParam(page: event.page));

      movies.fold((left) => emit(const MoviesFetchFailedState()),
          (right) => emit(MoviesFetchSuccessState(movies: right)));
    });
    on<UpcomingMoviesRequestedEvent>((event, emit) async {
      Either<Failur, List<Movie>> movies =
          await getUpcomingMovies.call(PagingParam(page: event.page));

      movies.fold((left) => emit(const MoviesFetchFailedState()),
          (right) => emit(MoviesFetchSuccessState(movies: right)));
    });
  }
}
