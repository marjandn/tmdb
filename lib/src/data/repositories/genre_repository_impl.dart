import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/genre_remote_datasource.dart';
import 'package:tmdb_prj/src/domain/entities/genre.dart';
import 'package:tmdb_prj/src/domain/repositories/genre_repository.dart';

class GenreRepositoryImpl extends GenreRepository {
  final GenreRemoteSource genreRemoteSource;

  GenreRepositoryImpl({required this.genreRemoteSource});

  @override
  Future<Either<Failur, Genre>> getMovieGenres() async {
    try {
      final Genre genres = await genreRemoteSource.getMovieGenres();
      return Right(genres);
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, Genre>> getTvShowGenres() async {
    try {
      final Genre genres = await genreRemoteSource.getTvShowGenres();

      return Right(genres);
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }
}
