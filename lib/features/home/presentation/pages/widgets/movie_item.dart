import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/blur_text.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key});

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4),
            child: SizedBox(
              width: 128,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: AppUtils.kBorderRadius8,
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://firebasestorage.googleapis.com/v0/b/sample-bloc-5b8b9.appspot.com/o/movie_photo.webp?alt=media',
                            width: 128,
                            fit: BoxFit.cover,
                            placeholder: (_, __) => alignLogo,
                            errorWidget: (_, __, ___) => alignLogo,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppUtils.kGap6,
                  const Text(
                    'Oliftaxon',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    'Сериал',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 0,
            child: BlurText(text: 'Экслюзив'),
          ),
        ],
      );
}
