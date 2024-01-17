import 'package:flutter/material.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/theme/themes.dart';
import '../../../../../core/widgets/painter/logo_painter.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) => SliverAppBar(
        pinned: true,
        centerTitle: false,
        systemOverlayStyle: systemUiOverlayStyle,
        elevation: context.theme.appBarTheme.elevation,
        scrolledUnderElevation:
            context.theme.appBarTheme.scrolledUnderElevation,
        shadowColor: context.theme.appBarTheme.shadowColor,
        title: const CustomPaint(
          painter: LogoPainter(color: Colors.white),
          size: Size(98, 28),
        ),
        actions: [
          IconButton(
            icon: const Icon(AppIcons.bell),
            onPressed: () {},
          ),
        ],
      );
}
