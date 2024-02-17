import "package:flutter/material.dart";

import "package:flutter_clean_architecture/core/utils/utils.dart";
import "package:flutter_clean_architecture/core/widgets/blur_text.dart";
import "package:flutter_clean_architecture/core/widgets/custom_cached_network_image.dart";

class OnlineTelevisionWidgets extends StatelessWidget {
  const OnlineTelevisionWidgets({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 130,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: AppUtils.kPaddingHor12,
          findChildIndexCallback: findChildIndexCallbackKeyInt,
          itemBuilder: (_, int index) => OnlineTelevisionItem(
            key: ObjectKey(index),
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
        children: <Widget>[
          SizedBox(
            width: 108,
            height: 126,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    borderRadius: AppUtils.kBorderRadius8,
                    child: CustomCachedNetworkImage(
                      imageUrl:
                          "https://firebasestorage.googleapis.com/v0/b/sample-bloc-5b8b9.appspot.com/o/movie_photo%20(1).webp?alt=media",
                      width: 108,
                      height: 108,
                      fit: BoxFit.cover,
                      placeholder: (_, __) => alignLogo,
                      errorWidget: (_, __, ___) => alignLogo,
                    ),
                  ),
                ),
                AppUtils.kGap6,
                const Text(
                  "МатчТВ",
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
            child: BlurText(text: "Бесплатно"),
          ),
        ],
      );
}
