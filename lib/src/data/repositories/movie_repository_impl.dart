import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/movie_details_response.dart';
import 'package:tmdb_prj/src/data/models/pictures_response.dart';
import 'package:tmdb_prj/src/data/models/movie_response.dart';
import 'package:tmdb_prj/src/data/providers/local/movie_local_datasource.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/movie_remote_datasource.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/movie_details.dart';
import 'package:tmdb_prj/src/domain/entities/credits.dart';
import 'package:tmdb_prj/src/domain/repositories/movie_repository.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/search_movie.dart';

import '../models/credits_response.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  final MovieLocalDataSource movieLocalDataSource;

  MovieRepositoryImpl({required this.movieRemoteDataSource, required this.movieLocalDataSource});

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

  @override
  Future<Either<Failur, List<Credits>>> getMovieCredits({required MovieDetailsParam param}) async {
    try {
      CreditsResponse movieResponse =
          await movieRemoteDataSource.getMovieCredits(detailsParam: param);

      return Right(movieResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.toString()));
    }
  }

  @override
  Future<Either<Failur, MovieDetails>> getMovieDetails({required MovieDetailsParam param}) async {
    try {
      MovieDetailsResponse movieResponse =
          await movieRemoteDataSource.getMovieDetails(detailsParam: param);

      return Right(movieResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.toString()));
    }
  }

  @override
  Future<Either<Failur, List<String>>> getMoviePictures({required MovieDetailsParam param}) async {
    try {
      PicturesResponse movieResponse =
          await movieRemoteDataSource.getMoviePictures(detailsParam: param);

      return Right(movieResponse.toEnity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.toString()));
    }
  }
}
