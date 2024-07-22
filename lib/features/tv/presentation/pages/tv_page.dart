import "package:flutter/material.dart";

import "package:flutter_clean_architecture/constants/image_constants.dart";
import "package:flutter_clean_architecture/core/extension/extension.dart";
import "package:flutter_clean_architecture/core/utils/utils.dart";
import "package:flutter_clean_architecture/core/widgets/loading/modal_progress_hud.dart";

part "mixin/tv_mixin.dart";

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
          title: const Text("Телевидение"),
          titleTextStyle: context.textStyle.appBarTitle,
        ),
        body: const ModalProgressHUD(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(AppImages.icBoxEmpty),
                width: 135,
                height: 135,
              ),
              AppUtils.kGap40,
              Text(
                "Пока нет телеканалов в этой категории",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
}
