import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../domain/entities/paginationState.dart';
import '../infrastructure/repositories/movieRepository.dart';

class MovieController {
  MovieController();

  final onNewsListController = BehaviorSubject<PaginationState>.seeded(const PaginationState());

  Stream<PaginationState> get onNewsListState => onNewsListController.stream;

  final onPageRequest = StreamController<int>();
  final _subscriptions = CompositeSubscription();

  add(int pageKey) {
    onPageRequest.sink.add(pageKey);
  }

  Stream<PaginationState> getStream() {
    onPageRequest.stream.flatMap(_fetchList).listen(onNewsListController.add).addTo(_subscriptions);
    return onNewsListState;
  }

  Stream<PaginationState> _fetchList(int pageKey) async* {
    final lastState = onNewsListController.value;
    try {
      final response = await MovieRepository().getMovies(pageKey);
      final isLastPage = pageKey == response?.total_pages;
      final nextPageKey = isLastPage ? 0 : pageKey + 1;
      yield PaginationState(
        error: null,
        nextPageKey: nextPageKey,
        itemList: [...lastState.itemList ?? [], ...response?.results??[]],
      );
    } catch (e) {
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
