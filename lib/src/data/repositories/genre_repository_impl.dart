import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/data/models/genre_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/genre_remote_datasource.dart';
import 'package:tmdb_prj/src/domain/entities/genre.dart';
import 'package:tmdb_prj/src/domain/repositories/genre_repository.dart';

class GenreRepositoryImpl extends GenreRepository {
  final GenreRemoteSource genreRemoteSource;

  GenreRepositoryImpl({required this.genreRemoteSource});

  @override
  Future<Either<Failur, List<Genre>>> getMovieGenres() async {
    try {
      final GenreResponse genres = await genreRemoteSource.getMovieGenres();
      return Right(genres.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<Genre>>> getTvShowGenres() async {
    try {
      final GenreResponse genres = await genreRemoteSource.getTvShowGenres();

      return Right(genres.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }
}
