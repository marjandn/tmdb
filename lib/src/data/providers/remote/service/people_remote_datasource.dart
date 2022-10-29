import 'package:dio/dio.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/people_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/client/dio_base_client.dart';
import 'package:tmdb_prj/src/domain/usercases/movie/get_popular_movies.dart';

abstract class PeopleRemoteDataSource {
  Future<PeopleResponse> getPopularPeople({required PagingParam pagingParam});
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
}
