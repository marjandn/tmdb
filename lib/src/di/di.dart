import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tmdb_prj/src/data/providers/remote/client/dio_base_client.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/genre_remote_datasource.dart';
import 'package:tmdb_prj/src/data/repositories/genre_repository_impl.dart';
import 'package:tmdb_prj/src/domain/repositories/genre_repository.dart';
import 'package:tmdb_prj/src/domain/usercases/genre/get_movie_genres.dart';
import 'package:tmdb_prj/src/domain/usercases/genre/get_tvshow_genres.dart';

final GetIt injector = GetIt.instance;

Future<void> setupServiceLocator() async {
  // * Dio client
  injector.registerSingleton<DioBaseClient>(DioBaseClient());

  // * Remote Services
  injector.registerLazySingleton<GenreRemoteSource>(
    () => GenreRemoteSourceImpl(dioClient: injector()),
  );

  // * Repositories
  injector.registerLazySingleton<GenreRepository>(
      () => GenreRepositoryImpl(genreRemoteSource: injector()));

  // * UseCases
  injector.registerLazySingleton<GetMovieGenres>(() => GetMovieGenres(genreRepository: injector()));
  injector
      .registerLazySingleton<GetTvShowGenres>(() => GetTvShowGenres(genreRepository: injector()));
}
