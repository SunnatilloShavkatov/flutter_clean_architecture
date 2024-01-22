import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/blur_text.dart';

class OnlineTelevisionWidgets extends StatelessWidget {
  const OnlineTelevisionWidgets({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 130,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: AppUtils.kPaddingHor12,
          itemBuilder: (_, index) => OnlineTelevisionItem(
            key: ValueKey(index),
          ),
          separatorBuilder: (_, __) => AppUtils.kGap8,
          itemCount: 6,
        ),
      );
}

class OnlineTelevisionItem extends StatelessWidget {
  const OnlineTelevisionItem({super.key});

  @override
  Widget build(BuildContext context) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: 108,
            height: 126,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: AppUtils.kBorderRadius8,
                    child: CachedNetworkImage(
                      imageUrl:
                          'http://storage.kun.uz/source/1/-lCIaFS7aamAeX9VVtntWPRDkPsJCZ8M.jpg',
                      width: 108,
                      height: 108,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AppUtils.kGap6,
                const Text(
                  'МатчТВ',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 0,
            left: -4,
            child: BlurText(text: 'Бесплатно'),
          ),
        ],
      );
}
