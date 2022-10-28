import 'package:flutter/material.dart';

import '../../../config/appColors.dart';
import '../../common/widgets/appText.dart';

class ItemInfoWidget extends StatelessWidget{
  const ItemInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          AppText(text: '#1 The Shawshank Redemption', fontWeight: FontWeight.w700, fontSize: 16),
          const SizedBox(height: 4),
          AppText(text: '(The Shawshank Redemption)', color: AppColors.silver, fontWeight: FontWeight.w600, fontSize: 14),
          const SizedBox(height: 4),
          Row(
            children: [
              AppText(text: '1994-09-23 (en) • ', color: AppColors.silver, fontSize: 13, fontWeight: FontWeight.w500),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), border: Border.all(color: AppColors.silver, width: .5)),
                alignment: Alignment.center,
                child: AppText(text: 'All', color: AppColors.silver, fontSize: 12, fontWeight: FontWeight.w500),
              )
            ],
          ),
          const SizedBox(height: 8),
          AppText(
            text: 'Framed in the 1040s for the ' * 10,
            fontSize: 11.5,
            color: AppColors.silver,
            maxLine: 5,
            textOverflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

}