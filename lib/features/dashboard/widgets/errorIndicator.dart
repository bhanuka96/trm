import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trm/features/common/application/connectionController.dart';
import 'package:trm/features/common/providers.dart';

import 'emptyListIndicator.dart';
import 'noInternet.dart';

class ErrorIndicator extends ConsumerWidget {
  const ErrorIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(connectionDetectProvider);
    if (state == NetworkStatus.off) {
      return NoInternet(ref: ref);
    }

    return EmptyListIndicator(ref: ref);
  }
}
