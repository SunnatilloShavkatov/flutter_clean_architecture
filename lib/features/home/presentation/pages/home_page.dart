import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/themes.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/animations/carousel_slider.dart';
import '../../../../core/widgets/painter/logo_painter.dart';
import 'widgets/banners_widget.dart';

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
            BannersWidget(
              controller: _pageController,
              currentPage: _currentPage,
            ),
            SliverList.list(
              children: [
                Padding(
                  padding: AppUtils.kPaddingHor16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Разработано SalomTV'),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(AppIcons.arrow_right),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 190,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: AppUtils.kPaddingHor12,
                    itemBuilder: (_, index) => Stack(
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
                                              'https://lh3.googleusercontent.com/proxy/IJp6rvDws96oXj0z0vQ9120H7lCyDPvgWbBmjjbq6JQsvO9084knafvAGBdVUIg4SEOv-DbOyDhAsL-_suW5qqSx',
                                          width: 128,
                                          fit: BoxFit.cover,
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
                        Positioned(
                          top: 0,
                          left: 0,
                          child: ClipRRect(
                            borderRadius: AppUtils.kBorderRadius24,
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10,
                                sigmaY: 10,
                              ),
                              child: const Material(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                borderRadius: AppUtils.kBorderRadius24,
                                child: Padding(
                                  padding: AppUtils.kPaddingHor8Ver2,
                                  child: Text(
                                    'Экслюзив',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    separatorBuilder: (_, __) => AppUtils.kGap8,
                    itemCount: 6,
                  ),
                ),
                Padding(
                  padding: AppUtils.kPaddingHor16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Онлайн телевидение'),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(AppIcons.arrow_right),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 130,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: AppUtils.kPaddingHor12,
                    itemBuilder: (_, index) => Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 4),
                          child: SizedBox(
                            width: 108,
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
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: ClipRRect(
                            borderRadius: AppUtils.kBorderRadius24,
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10,
                                sigmaY: 10,
                              ),
                              child: const Material(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                borderRadius: AppUtils.kBorderRadius24,
                                child: Padding(
                                  padding: AppUtils.kPaddingHor8Ver2,
                                  child: Text(
                                    'Бесплатно',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    separatorBuilder: (_, __) => AppUtils.kGap8,
                    itemCount: 6,
                  ),
                ),
                AppUtils.kGap16,
              ],
            ),
          ],
        ),
      );
}
