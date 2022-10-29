import 'package:dio/dio.dart';

import 'apiInterface.dart';
import 'dioExceptions.dart';
import 'dioService.dart';

class ApiService implements ApiInterface {
  late final DioService _dioService;

  ApiService(DioService dioService) : _dioService = dioService;

  @override
  Future<List<T>> getAllData<T>({
    required String endpoint,
    required Map<String, dynamic> queryParams,
    CancelToken? cancelToken,
    required T Function(Map<String, dynamic> responseBody) converter,
  }) async {
    List<Object?> body;

    try {
      // Entire map of response
      final data = await _dioService.get<List<Object?>>(
        endpoint: endpoint,
        queryParams: queryParams,
        cancelToken: cancelToken,
      );

      // Items of table as json
      body = data.body;
    } on Exception catch (ex) {
      throw DioExceptions.fromDioException(ex);
    }

    try {
      // Returning the deserialized objects
      return body.map((dataMap) => converter(dataMap! as Map<String, dynamic>)).toList();
    } on Exception catch (ex) {
      throw DioExceptions.fromParsingException(ex);
    }
  }

  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _dioService.cancelRequests(cancelToken: cancelToken);
  }
}
