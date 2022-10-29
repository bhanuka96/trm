import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/appError.dart';

enum NetworkStatus { notInitialize, on, off }

class NetworkDetectorNotifier extends StateNotifier<NetworkStatus> {
  // StreamController<ConnectivityResult> controller = StreamController<ConnectivityResult>();

  late NetworkStatus lastResult;

  StreamSubscription? subscription;

  NetworkDetectorNotifier() : super(NetworkStatus.notInitialize) {
    lastResult = NetworkStatus.notInitialize;
    Connectivity().checkConnectivity().then((value) {
      _set(value);
      subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
        _set(result);
      });
    });
  }

  void _set(ConnectivityResult result) {
    NetworkStatus newState;
    switch (result) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.wifi:
      case ConnectivityResult.vpn:
        newState = NetworkStatus.on;
        break;
      case ConnectivityResult.none:
      case ConnectivityResult.bluetooth:
        newState = NetworkStatus.off;
        break;
    }

    if (newState == NetworkStatus.off) {
      AppError.showConnectionError();
    } else if (state == NetworkStatus.off) {
      AppError.removeSnackBar();
    }

    if (newState != state) {
      state = newState;
    }
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint('connection: disposed');
    subscription?.cancel();
  }
}
