import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/movie_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/movie_remote_datasource.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:either_dart/src/either.dart';
import 'package:tmdb_prj/src/domain/repositories/movie_repository.dart';
import 'package:tmdb_prj/src/domain/usercases/genre/get_specific_genre_tvshows.dart';

class MovieRepositoryImpl extends MovieRepository {
  MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl({required this.movieRemoteDataSource});
  @override
  Future<Either<Failur, Movie>> getSpecificGenreMovies({required GenreParams genreParams}) {
    // TODO: implement getSpecificGenreMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failur, List<Movie>>> getPopularMovies() async {
    try {
      MovieResponse movieResponse = await movieRemoteDataSource.getPopularMovies();

      return Right(movieResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<Movie>>> getFeaturedMovies() async {
    try {
      MovieResponse movieResponse = await movieRemoteDataSource.getFeaturedMovies();

      return Right(movieResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<Movie>>> getLatestMovies() async {
    try {
      MovieResponse movieResponse = await movieRemoteDataSource.getLatestMovies();

      return Right(movieResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<Movie>>> getUpComingMovies() async {
    try {
      MovieResponse movieResponse = await movieRemoteDataSource.getUpComingMovies();

      return Right(movieResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }
}
