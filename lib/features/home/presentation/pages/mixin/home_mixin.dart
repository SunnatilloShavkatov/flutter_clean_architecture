part of 'package:flutter_clean_architecture/features/home/presentation/pages/home_page.dart';

mixin HomeMixin on State<HomePage> {
  late final PageController _pageController;
  late final TabController _tabController;

  void initControllers(TickerProvider vsync) {
    _tabController = TabController(
      length: 2,
      vsync: vsync,
    );
    _pageController = PageController(viewportFraction: 0.9);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
