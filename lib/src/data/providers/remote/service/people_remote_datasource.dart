import 'package:dio/dio.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/people_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/client/dio_base_client.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/search_movie.dart';

abstract class PeopleRemoteDataSource {
  Future<PeopleResponse> getPopularPeople({required PagingParam pagingParam});

  Future<PeopleResponse> searchPeople({required SearchParams params});
}

class PeopleRemoteDataSourceImpl extends PeopleRemoteDataSource {
  final DioBaseClient dioClient;

  PeopleRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<PeopleResponse> getPopularPeople({required PagingParam pagingParam}) async {
    try {
      Response response =
          await dioClient.getRequest(path: "person/popular", queryParameters: pagingParam.toJson());

      if (response.statusCode == 200) {
        PeopleResponse peopleResponse = PeopleResponse.fromJson(response.data);

        return peopleResponse;
      }

      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }

  @override
  Future<PeopleResponse> searchPeople({required SearchParams params}) async {
    try {
      final Response response =
          await dioClient.getRequest(path: 'search/person', queryParameters: params.toJson());

      if (response.statusCode == 200) {
        PeopleResponse peopleResponse = PeopleResponse.fromJson(response.data);

        return peopleResponse;
      }

      throw ServerException(response.statusCode.toString());
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}
