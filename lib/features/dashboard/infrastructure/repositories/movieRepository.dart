import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:trm/features/dashboard/domain/repositories/movieRepositoryInterface.dart';

import '../../domain/entities/movieEntity.dart';

class MovieRepository implements MovieRepositoryInterface {
  @override
  Future<MovieEntity?> getMovies(int page) async {
    try {
      const String key = String.fromEnvironment('TRM_KEY');
      debugPrint('API : page --> $page');
      final Response res = await Dio().get('https://api.themoviedb.org/3/movie/top_rated', queryParameters: {
        'language': 'en-US',
        'page': page,
        'api_key':key,
      });

      return MovieEntity.fromJson(res.data);
    } catch (e) {
      debugPrint('Error is : $e');
      rethrow;
      // return null;
    }
  }
}
