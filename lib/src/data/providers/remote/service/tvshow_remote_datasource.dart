import 'package:dio/dio.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/tvshow_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/client/dio_base_client.dart';
import 'package:tmdb_prj/src/domain/usercases/genre/get_specific_genre_tvshows.dart';
import 'package:tmdb_prj/src/domain/usercases/movie/get_popular_movies.dart';

abstract class TvShowRemoteDataSource {
  Future<TvShowResponse> getSpecificGenreTvShows(GenreParams genreParams);

  Future<TvShowResponse> getPopularTvShows({required PagingParam pagingParam});
  Future<TvShowResponse> getFeaturedTvShows({required PagingParam pagingParam});
  Future<TvShowResponse> getLatestTvShows({required PagingParam pagingParam});
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
  Future<TvShowResponse> getFeaturedTvShows({required PagingParam pagingParam}) async {
    try {
      Response response =
          await dioClient.getRequest(path: 'tv/top_rated', queryParameters: pagingParam.toJson());

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
  Future<TvShowResponse> getLatestTvShows({required PagingParam pagingParam}) async {
    try {
      Response response =
          await dioClient.getRequest(path: 'tv/latest', queryParameters: pagingParam.toJson());

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
  Future<TvShowResponse> getPopularTvShows({required PagingParam pagingParam}) async {
    try {
      Response response =
          await dioClient.getRequest(path: 'tv/popular', queryParameters: pagingParam.toJson());

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
