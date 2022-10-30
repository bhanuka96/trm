import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trm/config/appColors.dart';
import 'package:trm/config/appStrings.dart';
import 'package:trm/features/common/application/connectionController.dart';
import 'package:trm/features/common/providers.dart';
import 'package:trm/features/common/widgets/appText.dart';

import '../../../config/appGlobalKeys.dart';

class AppError extends ConsumerWidget {
  const AppError({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(connectionDetectProvider);
    debugPrint('connection: $state');
    if (state == NetworkStatus.off) {
      return Container(
        color: AppColors.black,
        width: double.infinity,
        padding: const EdgeInsets.all(3),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.signal_cellular_connected_no_internet_4_bar,color: AppColors.white,size: 12),
            const SizedBox(width: 10),
            AppText(text: AppStrings.noConnection, color: AppColors.white, fontSize: 12),
          ],
        ),
      );
    }
    return const SizedBox();
  }

  static showConnectionError() async {
    await removeSnackBar();
    AppKeys.rootScaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: AppText(
          text: AppStrings.noConnection,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.black,
        behavior: SnackBarBehavior.floating,

        action: SnackBarAction(label: 'Dismiss', onPressed: () => removeSnackBar(), textColor: AppColors.white),
        // duration: const Duration(minutes: 5),
      ),
    );
  }

  static showSnackError(String content) async {
    await removeSnackBar();
    AppKeys.rootScaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: AppText(
          text: content,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.black,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static removeSnackBar() {
    return AppKeys.rootScaffoldMessengerKey.currentState!.hideCurrentSnackBar();
  }
}
