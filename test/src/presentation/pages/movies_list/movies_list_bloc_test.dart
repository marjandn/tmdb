import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_upcoming_movies.dart';
import 'package:tmdb_prj/src/presentation/pages/movies_list/bloc/movies_list_bloc.dart';

import 'movies_list_bloc_test.mocks.dart';

@GenerateMocks([GetPopularMovies, GetUpcomingMovies])
void main() {
  late MoviesListBloc moviesListBloc;
  late GetPopularMovies getPopularMovies;

  List<Movie> successResponse = const [Movie(id: 1, totalPage: 10)];
  List<Movie> successNextPageResponse = const [Movie(id: 2, totalPage: 10)];

  List<Movie> successOnePageResponse = const [Movie(id: 1, totalPage: 1)];

  setUp(() {
    getPopularMovies = MockGetPopularMovies();
    moviesListBloc = MoviesListBloc(
        getPopularMovies: getPopularMovies, getUpcomingMovies: MockGetUpcomingMovies());
  });

  blocTest<MoviesListBloc, MoviesListState>(
    'emits [MoviesFetchSuccessState] when PopularMoviesRequestedEvent is added.',
    build: () => moviesListBloc,
    setUp: () {
      when(getPopularMovies.call(1)).thenAnswer((_) async => Right(successResponse));
    },
    act: (MoviesListBloc bloc) => bloc.add(const PopularMoviesRequestedEvent()),
    expect: () =>
        <MoviesListState>[MoviesFetchSuccessState(movies: successResponse, showLazyLoading: true)],
  );

  blocTest<MoviesListBloc, MoviesListState>(
    'emits [MoviesFetchSuccessState, MoviesFetchSuccessState] when PopularMoviesRequestedEvent is added twice.',
    build: () => moviesListBloc,
    setUp: () {
      when(getPopularMovies.call(1)).thenAnswer((_) async => Right(successResponse));
      when(getPopularMovies.call(2)).thenAnswer((_) async => Right(successNextPageResponse));
    },
    act: (MoviesListBloc bloc) => bloc
      ..add(const PopularMoviesRequestedEvent())
      ..add(const PopularMoviesRequestedEvent()),
    expect: () => <MoviesListState>[
      MoviesFetchSuccessState(movies: successResponse, showLazyLoading: true),
      MoviesFetchSuccessState(movies: successNextPageResponse, showLazyLoading: true)
    ],
  );

  blocTest<MoviesListBloc, MoviesListState>(
    'emits [MoviesFetchSuccessState] when PopularMoviesRequestedEvent is added twice with 1 Totatl Page.',
    build: () => moviesListBloc,
    setUp: () {
      when(getPopularMovies.call(1)).thenAnswer((_) async => Right(successOnePageResponse));
    },
    act: (MoviesListBloc bloc) => bloc
      ..add(const PopularMoviesRequestedEvent())
      ..add(const PopularMoviesRequestedEvent()),
    expect: () => <MoviesListState>[
      MoviesFetchSuccessState(movies: successResponse, showLazyLoading: false),
    ],
  );
}
