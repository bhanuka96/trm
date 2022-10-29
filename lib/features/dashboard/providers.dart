import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trm/features/dashboard/domain/entities/movieEntity.dart';
import 'package:trm/main.dart';

import 'application/movieController.dart';

final repositoryProvider = Provider(
  (ref) => MovieController(),
);

final moviesObjectsProvider = FutureProvider.autoDispose<List<Movie>>((ref) async {
  // final objectService = ref.watch(objectProvider);
  final movies = objectBox.getMovies();
  ref.keepAlive();
  return movies;
});
