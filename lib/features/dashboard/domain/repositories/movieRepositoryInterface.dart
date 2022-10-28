import '../entities/movieEntity.dart';

abstract class MovieRepositoryInterface {
  /// Get Movies
  Future<MovieEntity?> getMovies(int page);
}
