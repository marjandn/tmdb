import 'package:dio/dio.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/movie_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/client/dio_base_client.dart';
import 'package:tmdb_prj/src/domain/usecases/genre/get_specific_genre_tvshows.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/search_movie.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResponse> getSpecificGenreMovies(GenreParams genreParams);

  Future<MovieResponse> getPopularMovies({required PagingParam pagingParam});
  Future<MovieResponse> getUpComingMovies({required PagingParam pagingParam});
  Future<MovieResponse> getFeaturedMovies({required PagingParam pagingParam});
  Future<MovieResponse> getLatestMovies({required PagingParam pagingParam});

  Future<MovieResponse> searchMovies({required SearchParams searchParam});
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  DioBaseClient dioClient;

  MovieRemoteDataSourceImpl({required this.dioClient});
  @override
  Future<MovieResponse> getSpecificGenreMovies(GenreParams genreParams) {
    // TODO: implement getSpecificGenreMovies
    throw UnimplementedError();
  }

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
}
