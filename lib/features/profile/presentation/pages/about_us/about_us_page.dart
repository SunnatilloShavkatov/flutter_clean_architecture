import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/theme/themes.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/painter/logo_painter.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('О нас')),
        body: ListView(
          padding: AppUtils.kPaddingAll16,
          children: const [
            Align(child: Logo(size: 26)),
            AppUtils.kGap16,
            Text(
              'Salom TV - это онлайн-кинотеатр с производством собственных оригинальных веб-сериалов  Компания специализируется на дистрибуции иностранного контента, включая онлайн-трансляции ТВ, а также такие компании как: Start, Megogo, Videoteka, Setanta  В нашей библиотеке контента более 20 000 фильмов и сериалов ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            AppUtils.kGap24,
            Text(
              'Наши аккаунты в социальных сетях:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            AppUtils.kGap16,
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Item(icon: Icon(AppIcons.brand_telegram, size: 32)),
                AppUtils.kGap24,
                Item(icon: Icon(AppIcons.brand_instagram, size: 32)),
                AppUtils.kGap24,
                Item(icon: Icon(AppIcons.brand_youtube, size: 32)),
                AppUtils.kGap24,
                Item(icon: Icon(AppIcons.brand_facebook, size: 32)),
              ],
            ),
          ],
        ),
      );
}

class Item extends StatelessWidget {
  const Item({super.key, required this.icon});

  final Widget icon;

  @override
  Widget build(BuildContext context) => Container(
        padding: AppUtils.kPaddingAll8,
        decoration: ShapeDecoration(
          color: context.color.whiteOpacity05,
          shape: AppUtils.kShapeAll8,
        ),
        child: icon,
      );
}
