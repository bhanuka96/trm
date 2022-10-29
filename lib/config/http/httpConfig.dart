import 'package:flutter/foundation.dart';

@immutable
class HttpConfig {
  const HttpConfig._();

  static const baseUrl = String.fromEnvironment('BASE_URL');

  static const apiKey = String.fromEnvironment('TRM_KEY');
}
