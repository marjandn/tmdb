import 'package:dio/dio.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/credits_response.dart';
import 'package:tmdb_prj/src/data/models/pictures_response.dart';
import 'package:tmdb_prj/src/data/models/tvshow_details_response.dart';
import 'package:tmdb_prj/src/data/models/tvshow_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/client/dio_base_client.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/search_movie.dart';

import '../params/details_param.dart';

abstract class TvShowRemoteDataSource {
  Future<TvShowResponse> getPopularTvShows({required PagingParam pagingParam});
  Future<TvShowResponse> getFeaturedTvShows({required PagingParam pagingParam});
  Future<TvShowResponse> getLatestTvShows({required PagingParam pagingParam});

  Future<TvShowResponse> searchTvshow({required SearchParams searchParams});

  Future<TvshowDetailsResponse> getTvshowDetails({required TvshowDetailsParam detailsParam});
  Future<CreditsResponse> getTvShowCredits({required TvshowDetailsParam detailsParam});
  Future<PicturesResponse> getTvShowPictures({required TvshowDetailsParam detailsParam});
}

class TvShowRemoteDataSourceImpl extends TvShowRemoteDataSource {
  DioBaseClient dioClient;

  TvShowRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<TvShowResponse> getFeaturedTvShows({required PagingParam pagingParam}) async {
    try {
      final Response response =
          await dioClient.getRequest(path: 'tv/top_rated', queryParameters: pagingParam.toJson());

      if (response.statusCode == 200) {
        final TvShowResponse tvShowResponse = TvShowResponse.fromJson(response.data);

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
      final Response response =
          await dioClient.getRequest(path: 'tv/latest', queryParameters: pagingParam.toJson());

      if (response.statusCode == 200) {
        final TvShowResponse tvShowResponse = TvShowResponse.fromJson(response.data);

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
      final Response response =
          await dioClient.getRequest(path: 'tv/popular', queryParameters: pagingParam.toJson());

      if (response.statusCode == 200) {
        final TvShowResponse tvShowResponse = TvShowResponse.fromJson(response.data);

        return tvShowResponse;
      }

      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<TvShowResponse> searchTvshow({required SearchParams searchParams}) async {
    try {
      final Response response =
          await dioClient.getRequest(path: "search/tv", queryParameters: searchParams.toJson());

      if (response.statusCode == 200) {
        final TvShowResponse tvShowResponse = TvShowResponse.fromJson(response.data);

        return tvShowResponse;
      }
      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<PicturesResponse> getTvShowPictures({required TvshowDetailsParam detailsParam}) async {
    try {
      final Response response =
          await dioClient.getRequest(path: "tv/${detailsParam.tvshowId}/images");

      if (response.statusCode == 200) {
        final PicturesResponse pictures = PicturesResponse.fromJson(response.data);

        return pictures;
      }
      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<CreditsResponse> getTvShowCredits({required TvshowDetailsParam detailsParam}) async {
    try {
      final Response response =
          await dioClient.getRequest(path: "tv/${detailsParam.tvshowId}/credits");

      if (response.statusCode == 200) {
        final CreditsResponse res = CreditsResponse.fromJson(response.data);

        return res;
      }
      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<TvshowDetailsResponse> getTvshowDetails({required TvshowDetailsParam detailsParam}) async {
    try {
      final Response response = await dioClient.getRequest(path: "tv/${detailsParam.tvshowId}");

      if (response.statusCode == 200) {
        final TvshowDetailsResponse res = TvshowDetailsResponse.fromJson(response.data);

        return res;
      }
      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}
