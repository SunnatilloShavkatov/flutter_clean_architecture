import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/theme/themes.dart';
import '../../../../core/utils/utils.dart';
import '../../../../router/app_routes.dart';
import 'widgets/profile_item_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Профиль'),
          titleTextStyle: context.textStyle.appBarTitle,
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: AppUtils.kPaddingAll16,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ProfileItemWidget(
                      onTap: () {
                        // ignore: discarded_futures
                        context.pushNamed(Routes.auth);
                      },
                      title: const Text('Войти в приложение'),
                      leading: const Icon(AppIcons.login),
                    ),
                    AppUtils.kGap24,
                    ProfileItemWidget(
                      shape: AppUtils.kShapeTop8,
                      onTap: () {},
                      title: const Text('Данные профиля'),
                      leading: const Icon(AppIcons.user_circle),
                    ),
                    AppUtils.kDivider,
                    ProfileItemWidget(
                      shape: AppUtils.kShapeBottom8,
                      onTap: () {},
                      title: const Text('Устройства'),
                      leading: const Icon(AppIcons.devices),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
