import 'package:flutter/material.dart';
import 'package:trm/features/dashboard/domain/entities/movieEntity.dart';

import '../../../config/appColors.dart';
import 'itemImageTile.dart';
import 'itemInfoTile.dart';

class ListItemWidget extends StatelessWidget {
  final bool isPortrait;
  final Movie? movie;
  final int index;

  const ListItemWidget({super.key, required this.isPortrait, this.movie, required this.index});

  @override
  Widget build(BuildContext context) {
    if (movie == null) return const SizedBox();
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
            ItemImageWidget(movie: movie!),
            const SizedBox(width: 8),
            ItemInfoWidget(isPortrait: isPortrait, movie: movie!,index: index),
          ],
        ),
      ),
    );
  }
}
