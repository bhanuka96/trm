import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trm/features/dashboard/domain/entities/movieEntity.dart';
import 'package:trm/main.dart';

import '../common/providers.dart';
import 'application/movieController.dart';
import 'infrastructure/repositories/movieRepository.dart';

final movieRepositoryProvider = Provider(
  (ref) {
    final moviesRepository = ref.watch(moviesRepositoryProvider);
    return MovieController(movieRepository: moviesRepository);
  },
);

final moviesObjectsProvider = FutureProvider.autoDispose<List<Movie>>((ref) async {
  // final objectService = ref.watch(objectProvider);
  final movies = objectBox.getMovies();
  ref.keepAlive();
  return movies;
});

final moviesRepositoryProvider = Provider<MovieRepository>(
  (ref) {
    final apiService = ref.watch(apiServiceProvider);
    return MovieRepository(apiService: apiService);
  },
);
