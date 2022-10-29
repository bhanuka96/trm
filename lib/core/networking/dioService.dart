import 'package:dio/dio.dart';

import 'entities/responseModel.dart';

class DioService {
  final Dio _dio;

  final CancelToken _cancelToken;

  DioService({
    required Dio dioClient,
    Iterable<Interceptor>? interceptors,
    HttpClientAdapter? httpClientAdapter,
  })  : _dio = dioClient,
        _cancelToken = CancelToken() {
    if (interceptors != null) _dio.interceptors.addAll(interceptors);
    if (httpClientAdapter != null) _dio.httpClientAdapter = httpClientAdapter;
  }

  Future<ResponseModel<R>> get<R>({
    required String endpoint,
    Map<String,dynamic>? queryParams,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get<Map<String,dynamic>>(
      endpoint,
      queryParameters: queryParams,
      cancelToken: cancelToken ?? _cancelToken,
    );
    var data = ResponseModel<R>.fromJson(response.data!);
    return data;
  }

  void cancelRequests({CancelToken? cancelToken}) {
    if (cancelToken == null) {
      _cancelToken.cancel('Cancelled');
    } else {
      cancelToken.cancel();
    }
  }
}
