import 'package:dio/dio.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/movie_credits_response.dart';
import 'package:tmdb_prj/src/data/models/movie_details_response.dart';
import 'package:tmdb_prj/src/data/models/movie_pictures_response.dart';
import 'package:tmdb_prj/src/data/models/movie_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/client/dio_base_client.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/search_movie.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResponse> getPopularMovies({required PagingParam pagingParam});
  Future<MovieResponse> getUpComingMovies({required PagingParam pagingParam});
  Future<MovieResponse> getFeaturedMovies({required PagingParam pagingParam});
  Future<MovieResponse> getLatestMovies({required PagingParam pagingParam});

  Future<MovieResponse> searchMovies({required SearchParams searchParam});

  Future<MovieDetailsResponse> getMovieDetails({required MovieDetailsParam detailsParam});
  Future<MoviePicturesResponse> getMoviePictures({required MovieDetailsParam detailsParam});
  Future<MovieCreditsResponse> getMovieCredits({required MovieDetailsParam detailsParam});
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final DioBaseClient dioClient;

  MovieRemoteDataSourceImpl({required this.dioClient});

  // todo: Replace Response(from Dio lib) class with a wrapper class

  @override
  Future<MovieResponse> getPopularMovies({required PagingParam pagingParam}) async {
    try {
      Response response =
          await dioClient.getRequest(path: 'movie/popular', queryParameters: pagingParam.toJson());

      if (response.statusCode == 200) {
        MovieResponse movieResponse = MovieResponse.fromJson(response.data);

        return movieResponse;
      }

      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<MovieResponse> getFeaturedMovies({required PagingParam pagingParam}) async {
    try {
      Response response = await dioClient.getRequest(
          path: 'movie/top_rated', queryParameters: pagingParam.toJson());

      if (response.statusCode == 200) {
        MovieResponse movieResponse = MovieResponse.fromJson(response.data);

        return movieResponse;
      }

      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<MovieResponse> getUpComingMovies({required PagingParam pagingParam}) async {
    try {
      Response response =
          await dioClient.getRequest(path: 'movie/upcoming', queryParameters: pagingParam.toJson());

      if (response.statusCode == 200) {
        MovieResponse movieResponse = MovieResponse.fromJson(response.data);

        return movieResponse;
      }

      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<MovieResponse> getLatestMovies({required PagingParam pagingParam}) async {
    try {
      Response response =
          await dioClient.getRequest(path: 'movie/latest', queryParameters: pagingParam.toJson());

      if (response.statusCode == 200) {
        MovieResponse movieResponse = MovieResponse.fromJson(response.data);

        return movieResponse;
      }

      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<MovieResponse> searchMovies({required SearchParams searchParam}) async {
    try {
      Response response =
          await dioClient.getRequest(path: "search/movie", queryParameters: searchParam.toJson());
      if (response.statusCode == 200) {
        MovieResponse movieResponse = MovieResponse.fromJson(response.data);

        return movieResponse;
      }
      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<MovieDetailsResponse> getMovieDetails({required MovieDetailsParam detailsParam}) async {
    try {
      Response response = await dioClient.getRequest(path: 'movie/${detailsParam.movieId}');

      if (response.statusCode == 200) {
        MovieDetailsResponse movieDetailsResponse = MovieDetailsResponse.fromJson(response.data);

        return movieDetailsResponse;
      }
      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<MovieCreditsResponse> getMovieCredits({required MovieDetailsParam detailsParam}) async {
    try {
      Response response = await dioClient.getRequest(path: 'movie/${detailsParam.movieId}/credits');

      if (response.statusCode == 200) {
        MovieCreditsResponse movieDetailsResponse = MovieCreditsResponse.fromJson(response.data);

        return movieDetailsResponse;
      }
      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<MoviePicturesResponse> getMoviePictures({required MovieDetailsParam detailsParam}) async {
    try {
      Response response = await dioClient.getRequest(path: 'movie/${detailsParam.movieId}/images');

      if (response.statusCode == 200) {
        MoviePicturesResponse movieDetailsResponse = MoviePicturesResponse.fromJson(response.data);

        return movieDetailsResponse;
      }
      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}
