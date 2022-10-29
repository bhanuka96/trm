// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import '../../../domain/entities/movieEntity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 4259014786850967197),
      name: 'Movie',
      lastPropertyId: const IdUid(13, 7138858998165333366),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1142087660790885982),
            name: 'adult',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(2, 6539279125789893241),
            name: 'backdrop_path',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4454079212538115618),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(4, 4485335037068040266),
            name: 'original_language',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 3072455222173695700),
            name: 'original_title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 4533798736500167528),
            name: 'overview',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 1693879341385465174),
            name: 'popularity',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 7930747318649948829),
            name: 'poster_path',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 8480133071945222711),
            name: 'release_date',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 1976330611213429275),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 7441868489124705447),
            name: 'video',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 5514241320195759101),
            name: 'vote_average',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 7138858998165333366),
            name: 'vote_count',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 4259014786850967197),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Movie: EntityDefinition<Movie>(
        model: _entities[0],
        toOneRelations: (Movie object) => [],
        toManyRelations: (Movie object) => {},
        getId: (Movie object) => object.id,
        setId: (Movie object, int id) {
          if (object.id != id) {
            throw ArgumentError('Field Movie.id is read-only '
                '(final or getter-only) and it was declared to be self-assigned. '
                'However, the currently inserted object (.id=${object.id}) '
                "doesn't match the inserted ID (ID $id). "
                'You must assign an ID before calling [box.put()].');
          }
        },
        objectToFB: (Movie object, fb.Builder fbb) {
          final backdrop_pathOffset = object.backdrop_path == null
              ? null
              : fbb.writeString(object.backdrop_path!);
          final original_languageOffset = object.original_language == null
              ? null
              : fbb.writeString(object.original_language!);
          final original_titleOffset = object.original_title == null
              ? null
              : fbb.writeString(object.original_title!);
          final overviewOffset = object.overview == null
              ? null
              : fbb.writeString(object.overview!);
          final poster_pathOffset = object.poster_path == null
              ? null
              : fbb.writeString(object.poster_path!);
          final release_dateOffset = object.release_date == null
              ? null
              : fbb.writeString(object.release_date!);
          final titleOffset =
              object.title == null ? null : fbb.writeString(object.title!);
          fbb.startTable(14);
          fbb.addBool(0, object.adult);
          fbb.addOffset(1, backdrop_pathOffset);
          fbb.addInt64(2, object.id ?? 0);
          fbb.addOffset(3, original_languageOffset);
          fbb.addOffset(4, original_titleOffset);
          fbb.addOffset(5, overviewOffset);
          fbb.addFloat64(6, object.popularity);
          fbb.addOffset(7, poster_pathOffset);
          fbb.addOffset(8, release_dateOffset);
          fbb.addOffset(9, titleOffset);
          fbb.addBool(10, object.video);
          fbb.addFloat64(11, object.vote_average);
          fbb.addInt64(12, object.vote_count);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Movie(
              adult: const fb.BoolReader()
                  .vTableGetNullable(buffer, rootOffset, 4),
              backdrop_path: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              id: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              original_language: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              original_title: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12),
              overview: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14),
              popularity: const fb.Float64Reader()
                  .vTableGetNullable(buffer, rootOffset, 16),
              poster_path: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 18),
              release_date: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 20),
              title: const fb.StringReader(asciiOptimization: true).vTableGetNullable(buffer, rootOffset, 22),
              video: const fb.BoolReader().vTableGetNullable(buffer, rootOffset, 24),
              vote_average: const fb.Float64Reader().vTableGetNullable(buffer, rootOffset, 26),
              vote_count: const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 28));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Movie] entity fields to define ObjectBox queries.
class Movie_ {
  /// see [Movie.adult]
  static final adult = QueryBooleanProperty<Movie>(_entities[0].properties[0]);

  /// see [Movie.backdrop_path]
  static final backdrop_path =
      QueryStringProperty<Movie>(_entities[0].properties[1]);

  /// see [Movie.id]
  static final id = QueryIntegerProperty<Movie>(_entities[0].properties[2]);

  /// see [Movie.original_language]
  static final original_language =
      QueryStringProperty<Movie>(_entities[0].properties[3]);

  /// see [Movie.original_title]
  static final original_title =
      QueryStringProperty<Movie>(_entities[0].properties[4]);

  /// see [Movie.overview]
  static final overview =
      QueryStringProperty<Movie>(_entities[0].properties[5]);

  /// see [Movie.popularity]
  static final popularity =
      QueryDoubleProperty<Movie>(_entities[0].properties[6]);

  /// see [Movie.poster_path]
  static final poster_path =
      QueryStringProperty<Movie>(_entities[0].properties[7]);

  /// see [Movie.release_date]
  static final release_date =
      QueryStringProperty<Movie>(_entities[0].properties[8]);

  /// see [Movie.title]
  static final title = QueryStringProperty<Movie>(_entities[0].properties[9]);

  /// see [Movie.video]
  static final video = QueryBooleanProperty<Movie>(_entities[0].properties[10]);

  /// see [Movie.vote_average]
  static final vote_average =
      QueryDoubleProperty<Movie>(_entities[0].properties[11]);

  /// see [Movie.vote_count]
  static final vote_count =
      QueryIntegerProperty<Movie>(_entities[0].properties[12]);
}
