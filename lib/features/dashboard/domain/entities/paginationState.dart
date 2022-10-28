import 'package:freezed_annotation/freezed_annotation.dart';
import 'movieEntity.dart';

part 'paginationState.freezed.dart';

@freezed
class PaginationState with _$PaginationState {
  const PaginationState._();
  const factory PaginationState({
    @Default(null) final List<Movie?>? itemList,
    @Default(null) final dynamic error,
    @Default(1) final int? nextPageKey,
  }) = _PaginationState;
}