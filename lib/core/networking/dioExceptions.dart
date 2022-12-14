import 'package:dio/dio.dart';

/// An enum that holds names for our custom exceptions.
enum ExceptionType {
  /// Invalid Argument
  invalidArgumentException,

  /// Invalid Token
  invalidTokenException,

  /// The exception for an expired bearer token.
  tokenExpiredException,

  /// The exception for a prematurely cancelled request.
  cancelException,

  /// The exception for a failed connection attempt.
  connectTimeoutException,

  /// The exception for failing to send a request.
  sendTimeoutException,

  /// The exception for failing to receive a response.
  receiveTimeoutException,

  /// The exception for no internet connectivity.
  socketException,

  /// A better name for the socket exception.
  fetchDataException,

  /// The exception for an incorrect parameter in a request/response.
  formatException,

  /// The exception for an unknown type of failure.
  unrecognizedException,

  /// The exception for an unknown exception from the api.
  apiException,

  /// The exception for any parsing failure encountered during
  /// serialization/deserialization of a request.
  serializationException,
}

class DioExceptions implements Exception {
  final String name, message;
  final String? code;
  final int? statusCode;
  final ExceptionType exceptionType;

  DioExceptions({
    this.code,
    int? statusCode,
    required this.message,
    this.exceptionType = ExceptionType.apiException,
  })  : statusCode = statusCode ?? 500,
        name = exceptionType.name;

  factory DioExceptions.fromDioException(Exception error) {
    try {
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.cancel:
            return DioExceptions(
              exceptionType: ExceptionType.cancelException,
              statusCode: error.response?.statusCode,
              message: 'Request cancelled prematurely',
            );
          case DioErrorType.connectTimeout:
            return DioExceptions(
              exceptionType: ExceptionType.connectTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Connection not established',
            );
          case DioErrorType.sendTimeout:
            return DioExceptions(
              exceptionType: ExceptionType.sendTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Failed to send',
            );
          case DioErrorType.receiveTimeout:
            return DioExceptions(
              exceptionType: ExceptionType.receiveTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Failed to receive',
            );
          case DioErrorType.response:
          case DioErrorType.other:
            if (error.message.contains(ExceptionType.socketException.name)) {
              return DioExceptions(
                exceptionType: ExceptionType.fetchDataException,
                statusCode: error.response?.statusCode,
                message: 'No internet connectivity',
              );
            }
            final statusCode = error.response?.data?['status_code'] as int?;
            final statusMessage = error.response?.data?['status_message'] as String?;
            final isSuccess = error.response?.data?['success'] as bool?;
            final errors = error.response?.data?['errors'] as List?;

            if (errors?.isNotEmpty == true && isSuccess == false) {
              return DioExceptions(
                exceptionType: ExceptionType.unrecognizedException,
                statusCode: error.response?.statusCode,
                message: errors?[0] ?? 'Unknown',
              );
            }

            if (statusCode == 7 && isSuccess == false) {
              return DioExceptions(
                exceptionType: ExceptionType.invalidTokenException,
                statusCode: error.response?.statusCode,
                message: statusMessage ?? 'Unknown',
              );
            }
            return DioExceptions(
              message: 'Unknown',
              statusCode: error.response?.statusCode,
            );
        }
      } else {
        return DioExceptions(
          exceptionType: ExceptionType.unrecognizedException,
          message: 'Error unrecognized',
        );
      }
    } on FormatException catch (e) {
      return DioExceptions(
        exceptionType: ExceptionType.formatException,
        message: e.message,
      );
    } on Exception catch (_) {
      return DioExceptions(
        exceptionType: ExceptionType.unrecognizedException,
        message: 'Error unrecognized',
      );
    }
  }

  factory DioExceptions.fromParsingException(Exception error) {
    return DioExceptions(
      exceptionType: ExceptionType.serializationException,
      message: 'Failed to parse network response to model or vice versa',
    );
  }
}
