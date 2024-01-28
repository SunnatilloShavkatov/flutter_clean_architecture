import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extension/extension.dart';
import '../../../../core/theme/themes.dart';
import '../../../../core/utils/utils.dart';
import '../../../../router/app_routes.dart';
import 'widgets/profile_info_widget.dart';
import 'widgets/profile_item_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          surfaceTintColor: context.colorScheme.background,
          backgroundColor: context.colorScheme.background,
          shape: AppUtils.kShapeZero,
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: AppUtils.kPaddingAll16,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const ProfileInfoWidget(),
                    AppUtils.kGap24,
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
                      shape: AppUtils.kShapeZero,
                      onTap: () {},
                      title: const Text('Оплата и подписка'),
                      leading: const Icon(AppIcons.credit_card),
                    ),
                    AppUtils.kDivider,
                    ProfileItemWidget(
                      shape: AppUtils.kShapeZero,
                      onTap: () {},
                      title: const Text('История платежей'),
                      leading: const Icon(AppIcons.file_invoice),
                    ),
                    AppUtils.kDivider,
                    ProfileItemWidget(
                      shape: AppUtils.kShapeBottom8,
                      onTap: () {
                        // ignore: discarded_futures
                        context.pushNamed(Routes.devices);
                      },
                      title: const Text('Устройства'),
                      leading: const Icon(AppIcons.devices),
                    ),
                    AppUtils.kGap24,
                    ProfileItemWidget(
                      shape: AppUtils.kShapeTop8,
                      onTap: () {},
                      title: const Text('Промокод'),
                      leading: const Icon(AppIcons.gift),
                    ),
                    AppUtils.kDivider,
                    ProfileItemWidget(
                      shape: AppUtils.kShapeZero,
                      onTap: () {},
                      title: const Text('Поддержка'),
                      leading: const Icon(AppIcons.phone_call),
                    ),
                    AppUtils.kDivider,
                    ProfileItemWidget(
                      shape: AppUtils.kShapeZero,
                      onTap: () {},
                      title: const Text('Пользовательское соглашение'),
                      leading: const Icon(AppIcons.file_check),
                    ),
                    AppUtils.kDivider,
                    ProfileItemWidget(
                      shape: AppUtils.kShapeBottom8,
                      onTap: () {
                        // ignore: discarded_futures
                        context.pushNamed(Routes.aboutUs);
                      },
                      title: const Text('О нас'),
                      leading: const Icon(AppIcons.info_circle),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
