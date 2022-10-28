import 'package:flutter/material.dart';

import '../../../config/appColors.dart';
import '../../common/widgets/appText.dart';

class ItemImageWidget extends StatelessWidget {
  const ItemImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 130,
          height: 160,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage('https://www.themoviedb.org/t/p/w220_and_h330_face/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Positioned.fill(
          bottom: -20,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  const SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      value: .85,
                      backgroundColor: AppColors.grey,
                      color: AppColors.green,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: AppText(
                        text: '68%',
                        color: AppColors.white,
                        fontSize: 11,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
