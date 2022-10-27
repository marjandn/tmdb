import 'package:dio/dio.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';

import '../../../../app/constants/constants.dart';

class DioBaseClient {
  Dio? _dioClient;

  DioBaseClient() {
    _dioClient ??= Dio(BaseOptions(
      baseUrl: Constants.baseUrl,
    ));
  }

  Dio getInstantce() => _dioClient!;

  Future<Response> postRequest({required String path, Map<String, dynamic> data = const {}}) async {
    try {
      return await _dioClient!.post(path, data: {...data, 'api_key': Constants.apiToken});
    } on Exception {
      rethrow;
    }
  }

  Future<Response> getRequest(
      {required String path, Map<String, dynamic> queryParameters = const {}}) async {
    try {
      return await _dioClient!
          .get(path, queryParameters: {...queryParameters, 'api_key': Constants.apiToken});
    } catch (error) {
      throw Exception(error);
    }
  }
}
