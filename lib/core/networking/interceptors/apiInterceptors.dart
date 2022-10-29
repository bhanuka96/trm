import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  /// Primary purpose of  handling http request for to maintain header Token, Current API doesn't required header tokens
  // @override
  // Future<void> onRequest(
  //     RequestOptions options,
  //     RequestInterceptorHandler handler,
  //     ) async {
  //   return handler.next(options);
  // }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    final success = response.data['headers']['error'] == 0;

    if (success) return handler.next(response);

    //Reject all error codes from server except 402 and 200 OK
    return handler.reject(
      DioError(
        requestOptions: response.requestOptions,
        response: response,
      ),
    );
  }
}
