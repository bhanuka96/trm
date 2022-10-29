import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../config/appColors.dart';
import '../../common/widgets/appText.dart';
import '../domain/entities/movieEntity.dart';

class ItemImageWidget extends StatelessWidget {
  final Movie movie;

  const ItemImageWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Container(
        //   width: 130,
        //   height: 160,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: NetworkImage('https://www.themoviedb.org/t/p/w220_and_h330_face${movie.poster_path}'),
        //       fit: BoxFit.cover,
        //     ),
        //     borderRadius: BorderRadius.circular(12),
        //   ),
        // ),
        CachedNetworkImage(
          imageUrl: 'https://www.themoviedb.org/t/p/w220_and_h330_face${movie.poster_path}',
          width: 130,
          height: 160,
          imageBuilder: (_, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.silver.withOpacity(.1),
              border: Border.all(color: AppColors.primaryColor, width: .2),
            ),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.silver.withOpacity(.1),
                border: Border.all(color: AppColors.primaryColor, width: .2),
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.error, color: AppColors.primaryColor)),
        ),
        if (movie.popularity != null)
          Positioned.fill(
            bottom: -20,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(4),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        value: movie.vote_average! / 10,
                        backgroundColor: AppColors.grey,
                        color: AppColors.green,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: AppText(
                          text: '${(movie.vote_average! * 10).toInt()}%',
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
