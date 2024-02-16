import "package:flutter/material.dart";

import "package:flutter_clean_architecture/core/theme/themes.dart";
import "package:flutter_clean_architecture/core/utils/utils.dart";
import "package:flutter_clean_architecture/core/widgets/animations/carousel_slider.dart";
import "package:flutter_clean_architecture/core/widgets/painter/logo_painter.dart";
import "package:flutter_clean_architecture/core/widgets/title_right.dart";
import "package:flutter_clean_architecture/features/home/presentation/pages/widgets/banners_widget.dart";
import "package:flutter_clean_architecture/features/home/presentation/pages/widgets/movie_item.dart";
import "package:flutter_clean_architecture/features/home/presentation/pages/widgets/online_television_widgets.dart";

part "mixin/home_mixin.dart";

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
          title: const Logo(),
          actions: <Widget>[
            IconButton(
              icon: const Icon(AppIcons.bell),
              onPressed: () {},
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            BannersWidget(
              key: const ValueKey("banners"),
              controller: _pageController,
            ),
            SliverList.list(
              key: const ValueKey("list"),
              children: <Widget>[
                TitleRight(
                  title: "Разработано SalomTV",
                  onPressed: () {},
                ),
                SizedBox(
                  height: 190,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: AppUtils.kPaddingHor12,
                    itemBuilder: (_, int index) => MovieItem(
                      key: ValueKey(index),
                    ),
                    separatorBuilder: (_, __) => AppUtils.kGap8,
                    itemCount: 6,
                  ),
                ),
                TitleRight(
                  title: "Онлайн телевидение",
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
