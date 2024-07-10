part of "package:flutter_clean_architecture/features/home/presentation/pages/home_page.dart";

mixin HomeMixin on State<HomePage> {
  final CarouselSliderController _pageController = CarouselSliderController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
