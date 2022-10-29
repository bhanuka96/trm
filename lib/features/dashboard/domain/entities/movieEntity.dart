import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:objectbox/objectbox.dart';

part 'movieEntity.freezed.dart';

part 'movieEntity.g.dart';

@freezed
class MovieEntity with _$MovieEntity {
  const factory MovieEntity({
   int? page,
    List<Movie?>? results,
    int? total_pages,
    int? total_results,
  }) = _MovieEntity;

  factory MovieEntity.fromJson(Map<String, dynamic> json) => _$MovieEntityFromJson(json);
}

@freezed
class Movie with _$Movie {
  @Entity(realClass: Movie)
  const factory Movie({
    bool? adult,
    String? backdrop_path,
    @Id(assignable: true) int? id,
    String? original_language,
    String? original_title,
    String? overview,
    double? popularity,
    String? poster_path,
    String? release_date,
    String? title,
    bool? video,
    double? vote_average,
    int? vote_count,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
