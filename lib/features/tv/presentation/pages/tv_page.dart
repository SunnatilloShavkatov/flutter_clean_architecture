import 'package:flutter/material.dart';

import '../../../../core/extension/extension.dart';

class TvPage extends StatelessWidget {
  const TvPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Телевидение'),
          titleTextStyle: context.textStyle.appBarTitle,
        ),
      );
}
