import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/utils.dart';

class BlurText extends StatelessWidget {
  const BlurText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: AppUtils.kBorderRadius24,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Material(
            color: const Color.fromRGBO(0, 0, 0, 0.3),
            borderRadius: AppUtils.kBorderRadius24,
            child: Padding(
              padding: AppUtils.kPaddingHor8Ver2,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
}
