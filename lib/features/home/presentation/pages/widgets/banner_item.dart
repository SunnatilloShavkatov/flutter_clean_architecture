import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/theme/themes.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/buttons/custom_button.dart';
import 'tag_item.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                // memCacheHeight: context.kSize.width * 576 ~/ 1024,
                // memCacheWidth: context.kSize.width.toInt(),
                height: context.kSize.width * 576 / 1024,
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/sample-bloc-5b8b9.appspot.com/o/banner.webp?alt=media',
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
              Positioned(
                right: 16,
                bottom: 16,
                child: CustomButton(
                  height: 40,
                  onPressed: () {},
                  label: const Text('Смотреть'),
                  rightIcon: const Icon(AppIcons.player_play_filled),
                ),
              ),
              const Positioned(
                left: 16,
                bottom: 16,
                child: Text('Serjan Bratan'),
              ),
            ],
          ),
          SizedBox(
            height: 60,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: AppUtils.kPaddingAll16,
              itemBuilder: (_, index) => const TagItem(text: 'Сериал'),
              separatorBuilder: (_, __) => AppUtils.kGap8,
              itemCount: 6,
            ),
          ),
          const Padding(
            padding: AppUtils.kPaddingHor16,
            child: Text(
              'Авторитетный алматинский рэкетир, пролежав в коме 23 года,'
              ' неожиданно приходит в сознание. К своему ужасу он '
              'осознает, что на дворе 2021 год, его дети выросли, '
              'сам он постарел, а мир изменился до неузнаваемости. '
              'Теперь ему надо адаптироваться к реальности и наладить'
              ' отношения с семьей.',
              maxLines: 2,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      );
}
