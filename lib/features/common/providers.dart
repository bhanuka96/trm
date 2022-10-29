import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'application/connectionController.dart';

final connectionDetectProvider = StateNotifierProvider.autoDispose<NetworkDetectorNotifier, NetworkStatus>((ref) {
  return NetworkDetectorNotifier();
});

final connectionDetectOneTimeProvider = FutureProvider.autoDispose<ConnectivityResult>((ref) {
  return Connectivity().checkConnectivity();
});
