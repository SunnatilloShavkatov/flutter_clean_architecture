part of 'package:flutter_clean_architecture/features/home/presentation/pages/payments/payments_page.dart';

mixin PaymentsMixin on State<PaymentsPage> {
  late final TabController _tabController;

  void initController(TickerProvider vsync) {
    _tabController = TabController(length: 2, vsync: vsync);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
