import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:trm/core/networking/dioExceptions.dart';
import 'package:trm/features/dashboard/domain/entities/movieEntity.dart';
import 'package:trm/features/dashboard/infrastructure/repositories/movieRepository.dart';
import 'package:trm/features/dashboard/providers.dart';

@GenerateMocks([Dio, MovieEntity])
void main() {
  group('Movie API', () {
    late MovieRepository movieProvider;

    setUp(() {
      final container = ProviderContainer();
      movieProvider = container.read(moviesRepositoryProvider);
    });

    test('Successfully return movies', () async {
      expect(await movieProvider.fetchMovies(1), isA<MovieEntity>());
    });

    test('Test throws meaningful errors', () async {
      expect(await movieProvider.fetchMovies(0), throwsA(isA<DioExceptions>()));
    });
  });
}
