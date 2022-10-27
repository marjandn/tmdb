import 'package:dio/dio.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/people_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/client/dio_base_client.dart';

abstract class PeopleRemoteDataSource {
  Future<PeopleResponse> getPopularPeople();
}

class PeopleRemoteDataSourceImpl extends PeopleRemoteDataSource {
  final DioBaseClient dioClient;

  PeopleRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<PeopleResponse> getPopularPeople() async {
    try {
      Response response = await dioClient.getRequest(path: "person/popular");

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
