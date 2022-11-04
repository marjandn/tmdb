import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_prj/src/data/providers/local/movie_local_datasource.dart';
import 'package:tmdb_prj/src/data/providers/remote/client/dio_base_client.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/genre_remote_datasource.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/movie_remote_datasource.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/people_remote_datasource.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/tvshow_remote_datasource.dart';
import 'package:tmdb_prj/src/data/repositories/genre_repository_impl.dart';
import 'package:tmdb_prj/src/data/repositories/movie_repository_impl.dart';
import 'package:tmdb_prj/src/data/repositories/people_repository_impl.dart';
import 'package:tmdb_prj/src/data/repositories/tvshow_repository_impl.dart';
import 'package:tmdb_prj/src/domain/repositories/genre_repository.dart';
import 'package:tmdb_prj/src/domain/repositories/movie_repository.dart';
import 'package:tmdb_prj/src/domain/repositories/people_repository.dart';
import 'package:tmdb_prj/src/domain/usecases/genre/get_movie_genres.dart';
import 'package:tmdb_prj/src/domain/usecases/genre/get_specific_genre_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/genre/get_specific_genre_tvshows.dart';
import 'package:tmdb_prj/src/domain/usecases/genre/get_tvshow_genres.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_featured_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_latest_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_upcoming_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/search_movie.dart';
import 'package:tmdb_prj/src/domain/usecases/people/get_popular_people.dart';
import 'package:tmdb_prj/src/domain/usecases/people/search_people.dart';
import 'package:tmdb_prj/src/domain/usecases/tvshow/get_featured_tvshows.dart';
import 'package:tmdb_prj/src/domain/usecases/tvshow/get_latest_tvshows.dart';
import 'package:tmdb_prj/src/domain/usecases/tvshow/get_popular_tvshows.dart';
import 'package:tmdb_prj/src/domain/usecases/tvshow/search_tvshow.dart';
import 'package:tmdb_prj/src/presentation/pages/genre/bloc/genre_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/home/bloc/home_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/people_list/bloc/people_list_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/search/bloc/search_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/tvshow_list/bloc/tvshow_list_bloc.dart';

import '../domain/repositories/tvshow_repository.dart';
import '../presentation/pages/movies_list/bloc/movies_list_bloc.dart';

final GetIt injector = GetIt.instance;

Future<void> setupAllLocators() async {
  await registerSharedPreference();
  registerSyncLocators();
}

Future<void> registerSharedPreference() async {
  // * SharedPreferences db
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  injector.registerSingleton<SharedPreferences>(sharedPreferences);
}

registerSyncLocators() {
  // * Dio client
  injector.registerSingleton<DioBaseClient>(DioBaseClient());

  // * Local DataSources
  injector.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(sharedPreferences: injector.get<SharedPreferences>()));

  // * Remote DataSources
  injector.registerLazySingleton<GenreRemoteSource>(
    () => GenreRemoteSourceImpl(dioClient: injector<DioBaseClient>()),
  );
  injector.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(dioClient: injector<DioBaseClient>()),
  );
  injector.registerLazySingleton<TvShowRemoteDataSource>(
    () => TvShowRemoteDataSourceImpl(dioClient: injector<DioBaseClient>()),
  );
  injector.registerLazySingleton<PeopleRemoteDataSource>(
      () => PeopleRemoteDataSourceImpl(dioClient: injector<DioBaseClient>()));

  // * Repositories
  injector.registerLazySingleton<GenreRepository>(
      () => GenreRepositoryImpl(genreRemoteSource: injector<GenreRemoteSource>()));
  injector.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
      movieRemoteDataSource: injector<MovieRemoteDataSource>(),
      movieLocalDataSource: injector<MovieLocalDataSource>()));
  injector.registerLazySingleton<TvShowRepository>(
      () => TvShowRepositoryImpl(tvShowRemoteDataSource: injector<TvShowRemoteDataSource>()));
  injector.registerLazySingleton<PeopleRepository>(
    () => PeopleRepositoryImpl(peopleRemoteDataSource: injector<PeopleRemoteDataSource>()),
  );

  // * UseCases
  injector.registerLazySingleton<GetMovieGenres>(
      () => GetMovieGenres(genreRepository: injector<GenreRepository>()));
  injector.registerLazySingleton<GetTvShowGenres>(
      () => GetTvShowGenres(genreRepository: injector<GenreRepository>()));
  injector.registerLazySingleton<GetSpecificGenreMovies>(
      () => GetSpecificGenreMovies(movieRepository: injector<MovieRepository>()));
  injector.registerLazySingleton<GetSpecificGenreTvShows>(
      () => GetSpecificGenreTvShows(tvShowRepository: injector<TvShowRepository>()));

  injector.registerLazySingleton<GetPopularMovies>(
      () => GetPopularMovies(movieRepository: injector<MovieRepository>()));
  injector.registerLazySingleton<GetPopularPeople>(
      () => GetPopularPeople(peopleRepository: injector<PeopleRepository>()));
  injector.registerLazySingleton<GetFeaturedMovies>(
      () => GetFeaturedMovies(movieRepository: injector<MovieRepository>()));
  injector.registerLazySingleton<GetFeaturedTvShows>(
      () => GetFeaturedTvShows(tvShowRepository: injector<TvShowRepository>()));
  injector.registerLazySingleton<GetLatestMovies>(
      () => GetLatestMovies(movieRepository: injector<MovieRepository>()));
  injector.registerLazySingleton<GetLatestTvShows>(
      () => GetLatestTvShows(tvShowRepository: injector<TvShowRepository>()));
  injector.registerLazySingleton<GetPopularTvShows>(
      () => GetPopularTvShows(tvShowRepository: injector<TvShowRepository>()));
  injector.registerLazySingleton<GetUpcomingMovies>(
      () => GetUpcomingMovies(movieRepository: injector<MovieRepository>()));

  injector.registerLazySingleton<SearchMovie>(
      () => SearchMovie(movieRepository: injector<MovieRepository>()));
  injector.registerLazySingleton<SearchTvshow>(
      () => SearchTvshow(tvShowRepository: injector<TvShowRepository>()));
  injector.registerLazySingleton<SearchPeople>(
    () => SearchPeople(peopleRepository: injector<PeopleRepository>()),
  );

  // * BLoC
  injector.registerSingleton<HomeBloc>(HomeBloc(
    getPopularMovies: injector<GetPopularMovies>(),
    getPopularPeople: injector<GetPopularPeople>(),
    getFeaturedMovies: injector<GetFeaturedMovies>(),
    getFeaturedTvShows: injector<GetFeaturedTvShows>(),
    getLatestMovies: injector<GetLatestMovies>(),
    getLatestTvShows: injector<GetLatestTvShows>(),
    getPopularTvShows: injector<GetPopularTvShows>(),
    getUpcomingMovies: injector<GetUpcomingMovies>(),
  ));
  injector.registerSingleton<GenreBloc>(GenreBloc(
      getMovieGenres: injector<GetMovieGenres>(),
      getSpecificGenreMovies: injector<GetSpecificGenreMovies>(),
      getSpecificGenreTvShows: injector<GetSpecificGenreTvShows>(),
      getTvShowGenres: injector<GetTvShowGenres>()));

  injector.registerSingleton<SearchBloc>(SearchBloc(
    searchMovie: injector<SearchMovie>(),
    searchPeople: injector<SearchPeople>(),
    searchTvshow: injector<SearchTvshow>(),
  ));

  injector.registerSingleton<MoviesListBloc>(MoviesListBloc(
      getPopularMovies: injector<GetPopularMovies>(),
      getUpcomingMovies: injector<GetUpcomingMovies>()));
  injector.registerFactory<TvshowListBloc>(
    //todo: must be singlton with provider.value or factory with create???
    () => TvshowListBloc(
        getPopularTvShows: injector<GetPopularTvShows>(),
        getFeaturedTvShows: injector<GetFeaturedTvShows>()),
  );

  injector.registerSingleton<PeopleListBloc>(
      PeopleListBloc(getPopularPeople: injector<GetPopularPeople>()));
}
