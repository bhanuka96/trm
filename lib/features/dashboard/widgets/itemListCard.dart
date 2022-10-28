import 'package:flutter/material.dart';

import '../../../config/appColors.dart';
import 'itemImageTile.dart';
import 'itemInfoTile.dart';

class ListItemWidget extends StatelessWidget {
  final bool isPortrait;

  const ListItemWidget({super.key, required this.isPortrait});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: const EdgeInsets.only(bottom: 24, right: 4),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(color: AppColors.black.withOpacity(.2), spreadRadius: 0, blurRadius: 10),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ItemImageWidget(),
            const SizedBox(width: 8),
            ItemInfoWidget(isPortrait: isPortrait),
          ],
        ),
      ),
    );
  }
}
