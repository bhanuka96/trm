import 'package:flutter/material.dart';
import 'package:trm/features/dashboard/domain/entities/movieEntity.dart';

import '../../../config/appColors.dart';
import '../../common/widgets/appText.dart';

class ItemInfoWidget extends StatelessWidget {
  final Movie movie;
  final int index;
  final bool isPortrait;

  const ItemInfoWidget({super.key, required this.isPortrait, required this.movie, required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          AppText(text: '#${index + 1} ${movie.original_title ?? ''}', fontWeight: FontWeight.w700, fontSize: 16),
          const SizedBox(height: 4),
          AppText(text: '(${movie.title ?? ''})', color: AppColors.silver, fontWeight: FontWeight.w600, fontSize: 14),
          const SizedBox(height: 4),
          Row(
            children: [
              AppText(text: '${movie.release_date ?? ''} (${movie.original_language ?? ''}) • ', color: AppColors.silver, fontSize: 13, fontWeight: FontWeight.w500),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), border: Border.all(color: AppColors.silver, width: .5)),
                alignment: Alignment.center,
                child: AppText(text: movie.adult == true ? '+18' : 'All', color: AppColors.silver, fontSize: 12, fontWeight: FontWeight.w500),
              )
            ],
          ),
          const SizedBox(height: 8),
          AppText(
            text: movie.overview ?? '',
            fontSize: 11.5,
            color: AppColors.silver,
            maxLine: isPortrait ? 5 : 6,
            textOverflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
