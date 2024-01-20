part of 'package:flutter_clean_architecture/features/home/presentation/pages/home_page.dart';

mixin HomeMixin on State<HomePage> {
  late final CarouselSliderController _pageController;
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _pageController = CarouselSliderController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
