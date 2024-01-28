import 'package:flutter/material.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/utils/utils.dart';
import 'widgets/continue_browsing_widgets.dart';
import 'widgets/saved_widgets.dart';

part 'mixin/favorites_mixin.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage>
    with FavoritesMixin, TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    initControllers(this);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Избранное'),
          titleTextStyle: context.textStyle.appBarTitle,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(45),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                padding: AppUtils.kPaddingHor10,
                tabs: const [
                  Tab(text: 'Сохраненные', height: 45),
                  Tab(text: 'Продолжить просмотр', height: 45),
                  Tab(text: 'Вы искали', height: 45),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            SavedWidgets(),
            ContinueBrowsingWidgets(),
            Center(child: Text('Вы искали')),
          ],
        ),
      );
}
