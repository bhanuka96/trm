import '../../../domain/entities/movieEntity.dart';
import 'objectbox.g.dart';

class ObjectBox {
  late final Store _store;
  late final Box<Movie> _movieBox;

  ObjectBox._init(this._store) {
    _movieBox = Box<Movie>(_store);
  }

  static Future<ObjectBox> init() async {
    final store = await openStore();
    return ObjectBox._init(store);
  }

  Stream<List<Movie>> getMoviesStream() {
    // final builder = _movieBox.query(); //..order(flags: Order.descending);
    // return builder.watch(triggerImmediately: true).map((query) => query.find().sublist((page - 1) * 20, _movieBox.count(limit: 20)));
    return _movieBox.query().watch(triggerImmediately: true).map((event) => event.find());
  }

  List<Movie> getMovies() {
    return _movieBox.getAll();
  }

  List<int> setMovies(List<Movie?>? movies) {
    if (movies == null) return [];
    List<Movie> objects = [];
    for (int i = 0; i < movies.length; i++) {
      objects.add(movies[i]!);
    }
    return _movieBox.putMany(objects);
  }
}
