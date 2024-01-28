import 'package:flutter/material.dart';

import '../../../../constants/image_constants.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/utils/utils.dart';

part 'mixin/tv_mixin.dart';

class TvPage extends StatefulWidget {
  const TvPage({super.key});

  @override
  State<TvPage> createState() => _TvPageState();
}

class _TvPageState extends State<TvPage> with TvMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Телевидение'),
          titleTextStyle: context.textStyle.appBarTitle,
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(Images.icBoxEmpty),
              width: 135,
              height: 135,
            ),
            AppUtils.kGap40,
            Text(
              'Пока нет телеканалов в этой категории',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}
