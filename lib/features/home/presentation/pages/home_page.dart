import 'package:flutter/material.dart';

import '../../../../core/theme/themes.dart';
import '../../../../core/widgets/anim/carousel_slider.dart';
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
          ],
        ),
      );
}
