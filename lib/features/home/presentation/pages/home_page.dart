import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/theme/themes.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/buttons/custom_button.dart';
import '../../../../core/widgets/painter/logo_painter.dart';
import 'widgets/tag_item.dart';

part 'mixin/home_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const CustomPaint(
            painter: LogoPainter(color: Colors.white),
            size: Size(98, 28),
          ),
          actions: [
            IconButton(
              icon: const Icon(AppIcons.bell),
              onPressed: () {},
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverList.list(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      height: context.kSize.width * 576 / 1024,
                      imageUrl:
                          'https://tv7.kz/wp-content/uploads/2022/01/sj-1024x576.jpg?x56526',
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Positioned(
                      right: 16,
                      bottom: 16,
                      child: CustomButton(
                        onPressed: () {},
                        label: const Text('Смотреть'),
                        icon: const Icon(AppIcons.player_play_filled),
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
            ),
          ],
        ),
      );
}
