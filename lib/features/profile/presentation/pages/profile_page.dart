import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/utils.dart';
import '../../../../router/app_routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: false,
      title: const Text('Профиль'),
    ),
    body: CustomScrollView(
      slivers: [
        SliverPadding(
          padding: AppUtils.kPaddingAll16,
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                ListTile(
                  onTap: () {
                    // ignore: discarded_futures
                    context.pushNamed(Routes.settings);
                  },
                  title: const Text('Settings'),
                  leading: const Icon(Icons.settings),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
