import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/appColors.dart';
import '../../common/application/connectionController.dart';
import '../../common/providers.dart';
import '../../common/widgets/appText.dart';
import '../providers.dart';

class NoInternet extends StatelessWidget {
  final WidgetRef ref;

  const NoInternet({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(text: 'No Internet connection', fontSize: 20, fontWeight: FontWeight.w500),
        const SizedBox(height: 20),
        AppText(text: 'Check your connection, the refresh the page', color: AppColors.silver),
        const SizedBox(height: 20),
        OutlinedButton(
            onPressed: () {
              var state = ref.read(connectionDetectProvider);
              if (state == NetworkStatus.off) return;
              ref.read(repositoryProvider).add(1);
            },
            style: OutlinedButton.styleFrom(minimumSize: const Size(100, 30)),
            child: AppText(text: 'Refresh', color: AppColors.primaryColor, fontWeight: FontWeight.w600))
      ],
    );
  }
}
