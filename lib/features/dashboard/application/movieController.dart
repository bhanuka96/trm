import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:trm/core/networking/dioExceptions.dart';
import 'package:trm/features/common/application/connectionController.dart';
import 'package:trm/features/common/providers.dart';
import 'package:trm/main.dart';

import '../domain/entities/movieEntity.dart';
import '../domain/entities/paginationState.dart';
import '../infrastructure/repositories/movieRepository.dart';

class MovieController {
  final MovieRepository _movieRepository;

  MovieController({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super();

  final onNewsListController = BehaviorSubject<PaginationState>.seeded(const PaginationState());

  Stream<PaginationState> get onNewsListState => onNewsListController.stream;

  final onPageRequest = StreamController<int>();

  final _subscriptions = CompositeSubscription();

  List<Movie> cacheMovies = [];

  late WidgetRef ref;

  void init(WidgetRef ref, int pageKey) {
    this.ref = ref;
    cacheMovies = objectBox.getMovies();

    if (stillCache(pageKey)) {
      pageKey = (cacheMovies.length ~/ 20);
    }
    add(pageKey);
  }

  bool stillCache(int pageKey) {
    int page = (cacheMovies.length ~/ 20);

    return cacheMovies.length > 20 && pageKey < page;
  }

  void add(int pageKey) {
    onPageRequest.sink.add(pageKey);
  }

  Stream<PaginationState> getStream() {
    onPageRequest.stream.flatMap(_fetchList).listen(onNewsListController.add).addTo(_subscriptions);
    return onNewsListState;
  }

  Future<MovieEntity?> _get(int pageKey) {
    return _movieRepository.fetchMovies(pageKey);
  }

  Stream<PaginationState> _fetchList(int pageKey) async* {
    final lastState = onNewsListController.value;
    try {
      bool isLastPage = false;
      late List<Movie?>? results;

      if (pageKey == (cacheMovies.length ~/ 20)) {
        final totalPages = cacheMovies.length ~/ 20;
        // isLastPage = pageKey == totalPages;
        results = cacheMovies;
        debugPrint('isStillCache : PageKey=$pageKey, IsLast=$isLastPage , TotalPage=$totalPages , ResultLength=${results.length}');
      } else if (ref.read(connectionDetectOneTimeProvider).value == NetworkStatus.off) {
        debugPrint('Connection : ${ref.read(connectionDetectOneTimeProvider).value}');
        throw ('No Internet Connection');
      } else {
        final response = await _get(pageKey);
        isLastPage = pageKey == response?.total_pages;
        results = response?.results;
        debugPrint('isStillCache Not : PageKey=$pageKey, IsLast=$isLastPage , ResultLength=${results?.length}');
      }

      final nextPageKey = isLastPage ? 0 : pageKey + 1;

      final List<Movie?> data = [...lastState.itemList ?? [], ...results ?? []];

      objectBox.setMovies(data);

      yield PaginationState(
        error: null,
        nextPageKey: nextPageKey,
        itemList: data,
      );
    } catch (e) {
      if(e is DioExceptions){
        debugPrint('Error is : ${e.name} , ${e.message} , ${e.statusCode} , ${e.code} , ${e.exceptionType}');
      }
      yield PaginationState(
        error: e,
        nextPageKey: lastState.nextPageKey,
        itemList: lastState.itemList,
      );
    }
  }

  void dispose() {
    onPageRequest.close();
    _subscriptions.dispose();
    onNewsListController.close();
  }
}
