import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'application/movieController.dart';

final repositoryProvider = Provider(
      (ref) => MovieController(),
);