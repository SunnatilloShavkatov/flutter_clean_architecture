import 'package:flutter/material.dart';

import '../../extension/extension.dart';

class Line extends StatelessWidget {
  const Line({
    super.key,
    this.color,
    this.strokeHeight = 1,
    this.width = double.infinity,
  });

  final Color? color;
  final double strokeHeight;
  final double width;

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _LinePainter(
          color: color ?? context.colorScheme.secondaryContainer,
          strokeWidth: strokeHeight,
        ),
        size: Size(width, strokeHeight),
      );
}

class _LinePainter extends CustomPainter {
  const _LinePainter({
    required this.color,
    required this.strokeWidth,
  });

  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_LinePainter oldDelegate) => false;
}
