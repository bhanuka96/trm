import 'package:flutter/material.dart';

import '../../config/http/httpConfig.dart';

@immutable
class ApiEndpoint {
  const ApiEndpoint._();

  static const baseUrl = HttpConfig.baseUrl;

  /// Returns the path for an authentication [endpoint].
  static String movie(MovieEndpoint endpoint) {
    const path = '/3/movie';
    switch (endpoint) {
      case MovieEndpoint.topRated: return '$path/top_rated';
    }
  }
}

/// A collection of endpoints used for movies.
enum MovieEndpoint {
  topRated,
}