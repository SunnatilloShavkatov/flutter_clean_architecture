import 'package:flutter/material.dart';

import '../../../../core/theme/themes.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/animations/carousel_slider.dart';
import '../../../../core/widgets/painter/logo_painter.dart';
import '../../../../core/widgets/title_right.dart';
import 'widgets/banners_widget.dart';
import 'widgets/movie_item.dart';
import 'widgets/online_television_widgets.dart';

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
                TitleRight(
                  title: 'Разработано SalomTV',
                  onPressed: () {},
                ),
                SizedBox(
                  height: 190,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: AppUtils.kPaddingHor12,
                    itemBuilder: (_, index) => MovieItem(
                      key: ValueKey(index),
                    ),
                    separatorBuilder: (_, __) => AppUtils.kGap8,
                    itemCount: 6,
                  ),
                ),
                TitleRight(
                  title: 'Онлайн телевидение',
                  onPressed: () {},
                ),
                const OnlineTelevisionWidgets(),
                AppUtils.kGap16,
              ],
            ),
          ],
        ),
      );
}
