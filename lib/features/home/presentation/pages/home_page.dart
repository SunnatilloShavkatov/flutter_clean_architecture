import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/utils.dart';

import 'widgets/home_appbar.dart';

part 'mixin/home_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, HomeMixin {
  @override
  void initState() {
    super.initState();
    initControllers(this);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            const HomeAppBar(),
            SliverPadding(
              padding: AppUtils.kPaddingAll16,
              sliver: SliverToBoxAdapter(
                child: ClipRRect(
                  borderRadius: AppUtils.kBorderRadius12,
                  child: CachedNetworkImage(
                    height: 138,
                    fit: BoxFit.fitWidth,
                    imageUrl:
                        'https://sufio.com/content/media/images/waterbody.width-1440.jpg',
                  ),
                ),
              ),
            ),
            const SliverPadding(
              padding: AppUtils.kPaddingAll16,
              sliver: SliverToBoxAdapter(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Категории'),
                    Text('Показать все'),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
