import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/animations/carousel_slider.dart';
import 'banner_item.dart';
import 'dot_progress.dart';

final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

class BannersWidget extends StatelessWidget {
  const BannersWidget({
    super.key,
    this.controller,
  });

  final CarouselSliderController? controller;

  @override
  Widget build(BuildContext context) => SliverList.list(
        children: [
          SizedBox(
            height: context.kSize.width * 576 / 1024 + 92,
            width: context.kSize.width,
            child: CarouselSlider.builder(
              unlimitedMode: true,
              enableAutoSlider: true,
              slideTransform: slideTransforms[DateTime.now().weekday % 5],
              controller: controller,
              slideBuilder: (index) => BannerItem(
                key: ValueKey(index),
                index: index,
              ),
              itemCount: 6,
              onSlideChanged: (index) => _currentPage.value = index,
            ),
          ),
          AppUtils.kGap8,
          SizedBox(
            height: 12,
            child: Center(
              child: ValueListenableBuilder(
                valueListenable: _currentPage,
                builder: (_, value, __) => ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => DotProgress(
                    key: ValueKey(index),
                    isLoading: index == _currentPage.value % 6,
                  ),
                  separatorBuilder: (_, __) => AppUtils.kGap8,
                  itemCount: 6,
                ),
              ),
            ),
          ),
        ],
      );
}
