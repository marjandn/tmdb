import 'package:dio/dio.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/tvshow_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/client/dio_base_client.dart';
import 'package:tmdb_prj/src/domain/usercases/genre/get_specific_genre_tvshows.dart';

abstract class TvShowRemoteDataSource {
  Future<TvShowResponse> getSpecificGenreTvShows(GenreParams genreParams);

  Future<TvShowResponse> getPopularTvShows();
  Future<TvShowResponse> getFeaturedTvShows();
  Future<TvShowResponse> getLatestTvShows();
}

class TvShowRemoteDataSourceImpl extends TvShowRemoteDataSource {
  DioBaseClient dioClient;

  TvShowRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<TvShowResponse> getSpecificGenreTvShows(GenreParams genreParams) async {
    // TODO: implement getSpecificGenreMovies
    throw UnimplementedError();
  }

  @override
  Future<TvShowResponse> getFeaturedTvShows() async {
    try {
      Response response = await dioClient.getRequest(path: 'tv/top_rated');

      if (response.statusCode == 200) {
        TvShowResponse tvShowResponse = TvShowResponse.fromJson(response.data);

        return tvShowResponse;
      }

      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<TvShowResponse> getLatestTvShows() async {
    try {
      Response response = await dioClient.getRequest(path: 'tv/latest');

      if (response.statusCode == 200) {
        TvShowResponse tvShowResponse = TvShowResponse.fromJson(response.data);

        return tvShowResponse;
      }

      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<TvShowResponse> getPopularTvShows() async {
    try {
      Response response = await dioClient.getRequest(path: 'tv/popular');

      if (response.statusCode == 200) {
        TvShowResponse tvShowResponse = TvShowResponse.fromJson(response.data);

        return tvShowResponse;
      }

      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}
