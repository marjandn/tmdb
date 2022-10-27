import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/movie_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/client/dio_base_client.dart';
import 'package:tmdb_prj/src/domain/usercases/genre/get_specific_genre_tvshows.dart';
import 'package:tmdb_prj/src/presentation/pages/genre/genre_page.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResponse> getSpecificGenreMovies(GenreParams genreParams);

  Future<MovieResponse> getPopularMovies();
  Future<MovieResponse> getUpComingMovies();
  Future<MovieResponse> getFeaturedMovies();
  Future<MovieResponse> getLatestMovies();
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
  Future<MovieResponse> getPopularMovies() async {
    try {
      Response response = await dioClient.getRequest(path: 'movie/popular');

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
  Future<MovieResponse> getFeaturedMovies() async {
    try {
      Response response = await dioClient.getRequest(path: 'movie/top_rated');

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
  Future<MovieResponse> getUpComingMovies() async {
    try {
      Response response = await dioClient.getRequest(path: 'movie/upcoming');

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
  Future<MovieResponse> getLatestMovies() async {
    try {
      Response response = await dioClient.getRequest(path: 'movie/latest');

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
