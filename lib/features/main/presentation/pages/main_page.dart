import "package:flutter/material.dart";
import "package:flutter_clean_architecture/core/theme/themes.dart";
import "package:flutter_clean_architecture/core/widgets/bottom_navigation/bottom_indicator_bar.dart";
import "package:go_router/go_router.dart";

class MainPage extends StatelessWidget {
  const MainPage({
    required this.navigationShell, super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: navigationShell.currentIndex != 0,
        onPopInvoked: (bool v) => navigationShell.goBranch(0),
        child: Scaffold(
          body: navigationShell,
          bottomNavigationBar: BottomIndicatorBar(
            currentIndex: navigationShell.currentIndex,
            child: BottomNavigationBar(
              currentIndex: navigationShell.currentIndex,
              onTap: (int index) => changeTap(index, context),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.home),
                  label: "Главная",
                ),
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.device_tv),
                  label: "ТВ",
                ),
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.movie),
                  label: "Каталог",
                ),
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.favorites),
                  label: "Избранное",
                ),
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.user_circle),
                  label: "Профиль",
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
