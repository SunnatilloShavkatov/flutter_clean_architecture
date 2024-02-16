import "package:flutter/material.dart";
import "package:flutter_clean_architecture/core/extension/extension.dart";
import "package:flutter_clean_architecture/core/theme/themes.dart";
import "package:flutter_clean_architecture/core/utils/utils.dart";
import "package:flutter_clean_architecture/features/profile/presentation/pages/widgets/profile_info_widget.dart";
import "package:flutter_clean_architecture/features/profile/presentation/pages/widgets/profile_item_widget.dart";
import "package:flutter_clean_architecture/router/app_routes.dart";
import "package:go_router/go_router.dart";

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
          slivers: <Widget>[
            SliverPadding(
              padding: AppUtils.kPaddingAll16,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    const ProfileInfoWidget(),
                    AppUtils.kGap24,
                    ProfileItemWidget(
                      onTap: () {
                        // ignore: discarded_futures
                        context.pushNamed(Routes.auth);
                      },
                      shape: AppUtils.kShapeAll8,
                      title: "Войти в приложение",
                      leading: const Icon(AppIcons.login),
                    ),
                    AppUtils.kGap24,
                    ProfileItemWidget(
                      shape: AppUtils.kShapeTop8,
                      onTap: () {},
                      title: "Данные профиля",
                      leading: const Icon(AppIcons.user_circle),
                    ),
                    AppUtils.kDivider,
                    ProfileItemWidget(
                      onTap: () {},
                      title: "Оплата и подписка",
                      leading: const Icon(AppIcons.credit_card),
                    ),
                    AppUtils.kDivider,
                    ProfileItemWidget(
                      onTap: () {},
                      title: "История платежей",
                      leading: const Icon(AppIcons.file_invoice),
                    ),
                    AppUtils.kDivider,
                    ProfileItemWidget(
                      shape: AppUtils.kShapeBottom8,
                      onTap: () {
                        // ignore: discarded_futures
                        context.pushNamed(Routes.devices);
                      },
                      title: "Устройства",
                      leading: const Icon(AppIcons.devices),
                    ),
                    AppUtils.kGap24,
                    ProfileItemWidget(
                      shape: AppUtils.kShapeTop8,
                      onTap: () {},
                      title: "Промокод",
                      leading: const Icon(AppIcons.gift),
                    ),
                    AppUtils.kDivider,
                    ProfileItemWidget(
                      onTap: () {},
                      title: "Поддержка",
                      leading: const Icon(AppIcons.phone_call),
                    ),
                    AppUtils.kDivider,
                    ProfileItemWidget(
                      onTap: () {},
                      title: "Пользовательское соглашение",
                      leading: const Icon(AppIcons.file_check),
                    ),
                    AppUtils.kDivider,
                    ProfileItemWidget(
                      shape: AppUtils.kShapeBottom8,
                      onTap: () {
                        // ignore: discarded_futures
                        context.pushNamed(Routes.aboutUs);
                      },
                      title: "О нас",
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
