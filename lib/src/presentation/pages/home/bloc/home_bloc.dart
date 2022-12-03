import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow_details.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_featured_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_latest_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_upcoming_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/people/get_popular_people.dart';
import 'package:tmdb_prj/src/domain/usecases/tvshow/get_featured_tvshows.dart';
import 'package:tmdb_prj/src/domain/usecases/tvshow/get_latest_tvshows.dart';
import 'package:tmdb_prj/src/domain/usecases/tvshow/get_popular_tvshows.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPopularMovies getPopularMovies;
  final GetFeaturedMovies getFeaturedMovies;
  final GetUpcomingMovies getUpcomingMovies;
  final GetLatestMovies getLatestMovies;

  final GetPopularTvShows getPopularTvShows;
  final GetLatestTvShows getLatestTvShows;
  final GetFeaturedTvShows getFeaturedTvShows;

  final GetPopularPeople getPopularPeople;

  HomeBloc(
      {required this.getPopularMovies,
      required this.getPopularPeople,
      required this.getFeaturedMovies,
      required this.getFeaturedTvShows,
      required this.getLatestMovies,
      required this.getLatestTvShows,
      required this.getPopularTvShows,
      required this.getUpcomingMovies})
      : super(HomeInitial()) {
    // * Movies
    on<FeaturedMoviesFetchRequestedEvent>(
      (event, emit) async {
        emit(const FeaturedMoviesFetchLoadingState());

        Either<Failur, List<Movie>> movies = await getFeaturedMovies.call(PagingParam(page: 1));

        movies.fold((left) => emit(const FeaturedMoviesFetchFailedState()),
            (right) => emit(FeaturedMoviesFetchSuccessState(movies: right)));
      },
    );
    on<UpcomingMoviesFetchRequestedEvent>(
      (event, emit) async {
        emit(const UpcomingMoviesFetchLoadingState());

        Either<Failur, List<Movie>> movies = await getUpcomingMovies.call(PagingParam(page: 1));

        movies.fold((left) => emit(const UpcomingMoviesFetchLoadingState()),
            (right) => emit(UpcomingMoviesFetchSuccessState(movies: right)));
      },
    );
    on<PopularMoviesFetchRequestedEvent>(
      (event, emit) async {
        emit(const PopularMoviesFetchLoadingState());

        Either<Failur, List<Movie>> popularMovies = await getPopularMovies.call(1);

        popularMovies.fold((left) => emit(const PopularMoviesFetchFailedState()),
            (right) => emit(PopularMoviesFetchSuccessState(movies: right)));
      },
    );

    // *  TvShows
    on<PopularTvShowsFetchRequestedEvent>(
      (event, emit) async {
        emit(const PopularTvShowsFetchLoadingState());

        Either<Failur, List<TvShow>> tvShows = await getPopularTvShows.call(PagingParam(page: 1));

        tvShows.fold((left) => emit(const PopularTvShowsFetchFailedState()),
            (right) => emit(PopularTvShowsFetchSuccessState(tvShows: right)));
      },
    );
    on<FeaturedTvShowsFetchRequestedEvent>(
      (event, emit) async {
        emit(const FeaturedTvShowsFetchLoadingState());

        Either<Failur, List<TvShow>> tvShows = await getFeaturedTvShows.call(PagingParam(page: 1));

        tvShows.fold((left) => emit(const FeaturedTvShowsFetchFailedState()),
            (right) => emit(FeaturedTvShowsFetchSuccessState(tvShows: right)));
      },
    );

    // * People
    on<PopularPeopleFetchRequestEvent>(
      (event, emit) async {
        emit(const PopularPeopleFetchLoadingState());
        Either<Failur, List<People>> popularPeople =
            await getPopularPeople.call(PagingParam(page: 1));

        popularPeople.fold((left) => emit(const PopularPeopleFetchFailedState()),
            (right) => emit(PopularPeopleFetchSuccessState(people: right)));
      },
    );
  }
}
