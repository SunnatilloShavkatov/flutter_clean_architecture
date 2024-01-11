import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/themes.dart';
import '../../../../router/app_routes.dart';

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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: (index) => changeTap(index, context),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(AppIcons.home),
                label: 'Главная',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.grid),
                label: 'Каталог',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.clipboard),
                label: 'Мои записи',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.user),
                label: 'Профиль',
              ),
            ],
          ),
        ),
      );

  void changeTap(
    int index,
    BuildContext context,
  ) {
    if (index == 3 && !localSource.hasProfile) {
      // ignore: discarded_futures
      context.pushNamed(Routes.auth);
      return;
    }
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
