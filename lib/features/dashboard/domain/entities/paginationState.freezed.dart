// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paginationState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaginationState {
  List<Movie?>? get itemList => throw _privateConstructorUsedError;
  dynamic get error => throw _privateConstructorUsedError;
  int? get nextPageKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationStateCopyWith<PaginationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationStateCopyWith<$Res> {
  factory $PaginationStateCopyWith(
          PaginationState value, $Res Function(PaginationState) then) =
      _$PaginationStateCopyWithImpl<$Res, PaginationState>;
  @useResult
  $Res call({List<Movie?>? itemList, dynamic error, int? nextPageKey});
}

/// @nodoc
class _$PaginationStateCopyWithImpl<$Res, $Val extends PaginationState>
    implements $PaginationStateCopyWith<$Res> {
  _$PaginationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemList = freezed,
    Object? error = null,
    Object? nextPageKey = freezed,
  }) {
    return _then(_value.copyWith(
      itemList: freezed == itemList
          ? _value.itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<Movie?>?,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nextPageKey: freezed == nextPageKey
          ? _value.nextPageKey
          : nextPageKey // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationStateCopyWith<$Res>
    implements $PaginationStateCopyWith<$Res> {
  factory _$$_PaginationStateCopyWith(
          _$_PaginationState value, $Res Function(_$_PaginationState) then) =
      __$$_PaginationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Movie?>? itemList, dynamic error, int? nextPageKey});
}

/// @nodoc
class __$$_PaginationStateCopyWithImpl<$Res>
    extends _$PaginationStateCopyWithImpl<$Res, _$_PaginationState>
    implements _$$_PaginationStateCopyWith<$Res> {
  __$$_PaginationStateCopyWithImpl(
      _$_PaginationState _value, $Res Function(_$_PaginationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemList = freezed,
    Object? error = null,
    Object? nextPageKey = freezed,
  }) {
    return _then(_$_PaginationState(
      itemList: freezed == itemList
          ? _value._itemList
          : itemList // ignore: cast_nullable_to_non_nullable
              as List<Movie?>?,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
      nextPageKey: freezed == nextPageKey
          ? _value.nextPageKey
          : nextPageKey // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_PaginationState extends _PaginationState {
  const _$_PaginationState(
      {final List<Movie?>? itemList = null,
      this.error = null,
      this.nextPageKey = 1})
      : _itemList = itemList,
        super._();

  final List<Movie?>? _itemList;
  @override
  @JsonKey()
  List<Movie?>? get itemList {
    final value = _itemList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final dynamic error;
  @override
  @JsonKey()
  final int? nextPageKey;

  @override
  String toString() {
    return 'PaginationState(itemList: $itemList, error: $error, nextPageKey: $nextPageKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationState &&
            const DeepCollectionEquality().equals(other._itemList, _itemList) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.nextPageKey, nextPageKey) ||
                other.nextPageKey == nextPageKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_itemList),
      const DeepCollectionEquality().hash(error),
      nextPageKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationStateCopyWith<_$_PaginationState> get copyWith =>
      __$$_PaginationStateCopyWithImpl<_$_PaginationState>(this, _$identity);
}

abstract class _PaginationState extends PaginationState {
  const factory _PaginationState(
      {final List<Movie?>? itemList,
      final dynamic error,
      final int? nextPageKey}) = _$_PaginationState;
  const _PaginationState._() : super._();

  @override
  List<Movie?>? get itemList;
  @override
  dynamic get error;
  @override
  int? get nextPageKey;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationStateCopyWith<_$_PaginationState> get copyWith =>
      throw _privateConstructorUsedError;
}
