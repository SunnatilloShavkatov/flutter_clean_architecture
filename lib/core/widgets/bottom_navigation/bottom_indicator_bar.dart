import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import '../../extension/extension.dart';
import '../painter/line_painter.dart';

class BottomIndicatorBar extends StatelessWidget {
  final int currentIndex;
  final Widget child;
  final int length;

  const BottomIndicatorBar({
    super.key,
    this.currentIndex = 0,
    this.length = 5,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          child,
          const Positioned(left: 0, right: 0, top: 0, child: Line()),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedAlign(
              alignment: Alignment(
                _getIndicatorPosition(currentIndex, context),
                0,
              ),
              duration: const Duration(milliseconds: 300),
              child: Line(
                color: context.colorScheme.primary,
                width: context.kSize.width / length,
              ),
            ),
          ),
        ],
      );

  double _getIndicatorPosition(int index, BuildContext context) {
    final isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr) {
      return lerpDouble(-1.0, 1.0, index / (length - 1)) ?? 0;
    } else {
      return lerpDouble(1.0, -1.0, index / (length - 1)) ?? 0;
    }
  }
}
