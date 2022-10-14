import 'package:dio/dio.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';

import '../../../models/genre_response.dart';
import '../client/dio_base_client.dart';

abstract class GenreRemoteSource {
  Future<GenreResponse> getMovieGenres();

  Future<GenreResponse> getTvShowGenres();
}

class GenreRemoteSourceImpl extends GenreRemoteSource {
  DioBaseClient dioClient;

  GenreRemoteSourceImpl({required this.dioClient});

  @override
  Future<GenreResponse> getMovieGenres() async {
    try {
      final Response response = await dioClient.getRequest(path: "");

      if (response.statusCode == 200) {
        final GenreResponse genreResponse = GenreResponse.fromJson(response.data);

        return genreResponse;
      }

      throw ServerException(response.statusMessage ?? response.statusCode.toString());
    } on DioError catch (error) {
      throw ServerException(error.message);
    }
  }

  @override
  Future<GenreResponse> getTvShowGenres() async {
    try {
      final Response response = await dioClient.getRequest(path: "");

      if (response.statusCode == 200) {
        GenreResponse genreResponse = GenreResponse.fromJson(response.data);

        return genreResponse;
      }

      throw ServerException(response.statusMessage ?? response.statusCode.toString());
    } on DioError catch (error) {
      throw ServerException(error.message);
    }
  }
}
