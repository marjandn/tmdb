import 'package:dio/dio.dart';

import '../../../../app/constants/constants.dart';

class DioBaseClient {
  Dio? _dioClient;

  DioBaseClient() {
    _dioClient ??
        Dio(BaseOptions(
          baseUrl: Constants.baseUrl,
        ));
  }

  Dio getInstantce() => _dioClient!;

  Future<Response> postRequest({required String path, Map<String, dynamic> data = const {}}) async {
    try {
      data[''] = Constants.apiToken;
      return await _dioClient!.post(path, data: data);
    } on Exception {
      rethrow;
    }
  }

  Future<Response> getRequest(
      {required String path, Map<String, dynamic> queryParameters = const {}}) async {
    try {
      queryParameters[''] = Constants.apiToken;
      return await _dioClient!.get(path, queryParameters: queryParameters);
    } on DioError {
      rethrow;
    }
  }
}
