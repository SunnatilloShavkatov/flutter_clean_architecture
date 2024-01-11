import 'package:flutter/material.dart';
import '../../../../../core/theme/themes.dart';
import '../../../../../core/utils/utils.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) => SliverAppBar(
        pinned: true,
        expandedHeight: kToolbarHeight * 2,
        centerTitle: false,
        systemOverlayStyle: systemUiOverlayStyle,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location'),
            Text('Ташкент (Ташкент)'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(AppIcons.bell),
            onPressed: () {},
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: AppUtils.kPaddingAll12,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Услуга, специалист или место',
                prefixIcon: Icon(AppIcons.search),
                suffixIcon: Icon(AppIcons.marker_pin),
              ),
            ),
          ),
        ),
      );
}
