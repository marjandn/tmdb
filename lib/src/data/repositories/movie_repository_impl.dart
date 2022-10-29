import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/movie_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/movie_remote_datasource.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:either_dart/src/either.dart';
import 'package:tmdb_prj/src/domain/repositories/movie_repository.dart';
import 'package:tmdb_prj/src/domain/usercases/genre/get_specific_genre_tvshows.dart';
import 'package:tmdb_prj/src/domain/usercases/movie/get_popular_movies.dart';

class MovieRepositoryImpl extends MovieRepository {
  MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl({required this.movieRemoteDataSource});
  @override
  Future<Either<Failur, Movie>> getSpecificGenreMovies({required GenreParams genreParams}) {
    // TODO: implement getSpecificGenreMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failur, List<Movie>>> getPopularMovies({required PagingParam pagingParam}) async {
    try {
      MovieResponse movieResponse =
          await movieRemoteDataSource.getPopularMovies(pagingParam: pagingParam);

      return Right(movieResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<Movie>>> getFeaturedMovies({required PagingParam pagingParam}) async {
    try {
      MovieResponse movieResponse =
          await movieRemoteDataSource.getFeaturedMovies(pagingParam: pagingParam);

      return Right(movieResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<Movie>>> getLatestMovies({required PagingParam pagingParam}) async {
    try {
      MovieResponse movieResponse =
          await movieRemoteDataSource.getLatestMovies(pagingParam: pagingParam);

      return Right(movieResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<Movie>>> getUpComingMovies({required PagingParam pagingParam}) async {
    try {
      MovieResponse movieResponse =
          await movieRemoteDataSource.getUpComingMovies(pagingParam: pagingParam);

      return Right(movieResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }
}
