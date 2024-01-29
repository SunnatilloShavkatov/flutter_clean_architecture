import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/theme/themes.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/painter/dot_painter.dart';

class SavedWidgets extends StatefulWidget {
  const SavedWidgets({super.key});

  @override
  State<SavedWidgets> createState() => _SavedWidgetsState();
}

class _SavedWidgetsState extends State<SavedWidgets>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: [
        SliverSafeArea(
          minimum: AppUtils.kPaddingAll16,
          sliver: SliverGrid.builder(
            itemCount: 16,
            itemBuilder: (_, index) => SavedItem(key: ValueKey(index)),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 8,
              childAspectRatio: 108 / 164,
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class SavedItem extends StatelessWidget {
  const SavedItem({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: AppUtils.kBorderRadius8,
                child: CustomCachedNetworkImage(
                  height: 130,
                  width: (context.width - 48) / 3,
                  imageUrl: 'https://kinolar.tv/_ld/1/63943269.jpg',
                  placeholder: (_, __) => alignLogo,
                  errorWidget: (_, __, ___) => alignLogo,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 0,
                top: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: const ShapeDecoration(
                    color: Color(0xFFAA00A3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                  ),
                  child: const Text(
                    '9,0',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 6,
                bottom: 6,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: ShapeDecoration(
                    color: Colors.black.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    '+16',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: IconButton(
                  onPressed: () {},
                  constraints: AppUtils.kBoxConstraints24,
                  style: context.shapes.favoriteButtonStyle,
                  icon: const Icon(AppIcons.favorites_fill),
                  iconSize: 16,
                ),
              ),
            ],
          ),
          AppUtils.kGap6,
          const Text(
            'Побег из Шоушенка',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          AppUtils.kGap2,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Фильм',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                ),
              ),
              AppUtils.kGap4,
              const Dot(),
              AppUtils.kGap4,
              Text(
                '1994',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      );
}
