part of "../tv_page.dart";

mixin TvMixin on State<TvPage> {
  @override
  void initState() {
    super.initState();
    print("TvPage init");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("TvPage deactivate");
  }
}
