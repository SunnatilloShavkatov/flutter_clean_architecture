import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/theme/themes.dart';
import '../../../../../core/widgets/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../core/widgets/bottom_sheet/update_app_sheet.dart';
import '../../../../../core/widgets/painter/logo_painter.dart';
import '../../../../../router/app_routes.dart';
import '../../../../../services/remote_config_service.dart';

part 'mixins/splash_mixin.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SplashMixin {
  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: systemUiOverlayStyle,
        child: Scaffold(
          backgroundColor: context.colorScheme.surface,
          body: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: context.padding.bottom + 24,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              const Positioned.fill(
                child: Center(
                  child: CustomPaint(
                    painter: LogoPainter(),
                    size: Size(160, 160),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
