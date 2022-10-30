import 'package:flutter/foundation.dart';
import 'package:trm/config/http/httpConfig.dart';
import 'package:trm/core/networking/apiEndpoint.dart';
import 'package:trm/features/dashboard/domain/repositories/movieRepositoryInterface.dart';

import '../../../../core/networking/apiService.dart';
import '../../domain/entities/movieEntity.dart';

class MovieRepository implements MovieRepositoryInterface {
  final ApiService _apiService;

  MovieRepository({required ApiService apiService}) : _apiService = apiService;

  @override
  Future<MovieEntity?> fetchMovies(int page) async {
    try {
      final Map<String, dynamic> queryParams = {
        'language': 'en-US',
        'page': page,
        'api_key': HttpConfig.apiKey,
      };
      return _apiService.getAllData(endpoint: ApiEndpoint.movie(MovieEndpoint.topRated), queryParams: queryParams, converter: MovieEntity.fromJson);
    } catch (e) {
      debugPrint('Error is : $e');
      rethrow;
    }
  }
}
