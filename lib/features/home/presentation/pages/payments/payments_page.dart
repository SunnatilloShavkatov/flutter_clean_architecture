import 'package:flutter/material.dart';

part 'mixin/payments_mixin.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage>
    with PaymentsMixin, TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    initController(this);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Платежи'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(36),
            child: TabBar(
              padding: EdgeInsets.zero,
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(text: 'Платежи', height: 36),
                Tab(text: 'Переводы', height: 36),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            Center(child: Text('Payments')),
            Center(child: Text('Transfers')),
          ],
        ),
      );
}
