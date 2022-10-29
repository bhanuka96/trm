import 'package:dio/dio.dart';

abstract class ApiInterface {
  const ApiInterface();


  Future<List<T>> getAllData<T>({
    required String endpoint,
    required Map<String,dynamic> queryParams,
    CancelToken? cancelToken,
    required T Function(Map<String,dynamic> responseBody) converter,
  });

  void cancelRequests({CancelToken? cancelToken});
}