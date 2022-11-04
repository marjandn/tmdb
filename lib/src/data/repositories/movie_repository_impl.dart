import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/movie_response.dart';
import 'package:tmdb_prj/src/data/providers/local/movie_local_datasource.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/movie_remote_datasource.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/repositories/movie_repository.dart';
import 'package:tmdb_prj/src/domain/usecases/genre/get_specific_genre_tvshows.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/search_movie.dart';
import 'package:tmdb_prj/src/presentation/pages/movies_list/bloc/movies_list_bloc.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  final MovieLocalDataSource movieLocalDataSource;

  MovieRepositoryImpl({required this.movieRemoteDataSource, required this.movieLocalDataSource});
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

      movieLocalDataSource.savePopularMoviesFirstPage(movieResponse: movieResponse);
    } on ServerException catch (error) {
      log(error.errorMessage);
    }

    List<Movie> movies = movieLocalDataSource.getPopularMoviesFirstPage()?.toEntity() ?? [];
    return Right(movies);
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

  @override
  Future<Either<Failur, List<Movie>>> searchMovies({required SearchParams searchParams}) async {
    try {
      MovieResponse movieResponse =
          await movieRemoteDataSource.searchMovies(searchParam: searchParams);

      return Right(movieResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.toString()));
    }
  }
}
