import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/theme/themes.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: navigationShell.currentIndex != 0,
        onPopInvoked: (v) => navigationShell.goBranch(0),
        child: Scaffold(
          body: navigationShell,
          bottomNavigationBar: Material(
            shape: context.shapes.topRectangleBorder,
            child: BottomNavigationBar(
              currentIndex: navigationShell.currentIndex,
              onTap: (index) => changeTap(index, context),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.home),
                  label: 'Главная',
                ),
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.device_tv),
                  label: 'ТВ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.movie),
                  label: 'Каталог',
                ),
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.favorites),
                  label: 'Избранное',
                ),
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.user_circle),
                  label: 'Профиль',
                ),
              ],
            ),
          ),
        ),
      );

  void changeTap(
    int index,
    BuildContext context,
  ) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
