// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieEntity _$$_MovieEntityFromJson(Map<String, dynamic> json) =>
    _$_MovieEntity(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      total_pages: json['total_pages'] as int?,
      total_results: json['total_results'] as int?,
    );

Map<String, dynamic> _$$_MovieEntityToJson(_$_MovieEntity instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
    };

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      adult: json['adult'] as bool?,
      backdrop_path: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      original_language: json['original_language'] as String?,
      original_title: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      poster_path: json['poster_path'] as String?,
      release_date: json['release_date'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      vote_average: (json['vote_average'] as num?)?.toDouble(),
      vote_count: json['vote_count'] as int?,
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdrop_path,
      'id': instance.id,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.poster_path,
      'release_date': instance.release_date,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
    };
