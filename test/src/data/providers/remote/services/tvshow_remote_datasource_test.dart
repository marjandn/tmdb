import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/tvshow_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/client/dio_base_client.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/tvshow_remote_datasource.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';

import 'tvshow_remote_datasource_test.mocks.dart';

@GenerateMocks([DioBaseClient, Response, TvShowResponse])
void main() {
  late TvShowRemoteDataSourceImpl tvShowRemoteDataSourceImpl;
  late DioBaseClient dioBaseClient;

  setUpAll(
    () {
      dioBaseClient = MockDioBaseClient();
      tvShowRemoteDataSourceImpl = TvShowRemoteDataSourceImpl(dioClient: dioBaseClient);
    },
  );

  group("Popular Tv Show Request tests", () {
    test("getPopularTvShow request, Return success response", () async {
      // Arrange
      PagingParam pagingParam = PagingParam(page: 1);
      Response successResponse = MockResponse();
      when(successResponse.statusCode).thenReturn(200);
      when(successResponse.data).thenReturn({"page": 1, "total_pages": 10});
      when(dioBaseClient.getRequest(path: 'tv/popular', queryParameters: pagingParam.toJson()))
          .thenAnswer((_) async => successResponse);

      // Act
      TvShowResponse response =
          await tvShowRemoteDataSourceImpl.getPopularTvShows(pagingParam: pagingParam);

      // Assert
      expect(response.page, 1);
    });

    test("getPopularTvshow request, Throw an exception", () async {
      // Arrange
      PagingParam pagingParam = PagingParam(page: 1);
      when(dioBaseClient.getRequest(path: 'tv/popular', queryParameters: pagingParam.toJson()))
          .thenThrow((_) => IOException);

      // Act

      // Assert
      expect(() => tvShowRemoteDataSourceImpl.getPopularTvShows(pagingParam: pagingParam),
          throwsA(isA<ServerException>()));
    });
  });
}
