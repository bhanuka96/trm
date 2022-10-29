import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/networking/apiEndpoint.dart';
import '../../core/networking/apiService.dart';
import '../../core/networking/dioService.dart';
import '../../core/networking/interceptors/apiInterceptors.dart';
import '../../core/networking/interceptors/loggerInterceptors.dart';
import 'application/connectionController.dart';

final connectionDetectProvider = StateNotifierProvider.autoDispose<NetworkDetectorNotifier, NetworkStatus>((ref) {
  return NetworkDetectorNotifier();
});

final connectionDetectOneTimeProvider = FutureProvider.autoDispose<ConnectivityResult>((ref) {
  return Connectivity().checkConnectivity();
});

final _dioProvider = Provider<Dio>((ref) {
  final baseOptions = BaseOptions(baseUrl: ApiEndpoint.baseUrl);
  return Dio(baseOptions);
});

final _dioServiceProvider = Provider<DioService>((ref) {
  final dio = ref.watch(_dioProvider);

  return DioService(
    dioClient: dio,
    interceptors: [
      // Order of interceptors very important
      ApiInterceptor(),
      if (kDebugMode) LoggingInterceptor(),
    ],
  );
});

final apiServiceProvider = Provider<ApiService>((ref) {
  final dioService = ref.watch(_dioServiceProvider);
  return ApiService(dioService);
});