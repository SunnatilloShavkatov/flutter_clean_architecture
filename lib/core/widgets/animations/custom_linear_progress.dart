import 'package:flutter/material.dart';

class CustomLinearProgress extends StatelessWidget {
  final Color valueColor;
  final Color? backgroundColor;
  final double percent;
  final double strokeWidth;
  final bool isAnimate;

  const CustomLinearProgress({
    super.key,
    this.valueColor = Colors.white,
    required this.percent,
    this.strokeWidth = 3,
    this.backgroundColor,
    this.isAnimate = false,
  });

  @override
  Widget build(BuildContext context) {
    final indicatorTheme = ProgressIndicatorTheme.of(context);
    final Color trackColor =
        backgroundColor ?? indicatorTheme.linearTrackColor ?? Colors.grey;
    if (isAnimate) {
      return TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
        tween: Tween<double>(begin: 0, end: percent),
        builder: (_, value, __) => ConstrainedBox(
          constraints: BoxConstraints(minHeight: strokeWidth),
          child: CustomPaint(
            painter: LinearProgressPainter(
              percent: value,
              valueColor: valueColor,
              backgroundColor: trackColor,
              strokeWidth: strokeWidth,
            ),
          ),
        ),
      );
    } else {
      return ConstrainedBox(
        constraints: BoxConstraints(minHeight: strokeWidth),
        child: CustomPaint(
          painter: LinearProgressPainter(
            percent: percent,
            valueColor: valueColor,
            backgroundColor: trackColor,
            strokeWidth: strokeWidth,
          ),
        ),
      );
    }
  }
}

class LinearProgressPainter extends CustomPainter {
  final Color backgroundColor;
  final Color valueColor;
  final double percent;
  final double strokeWidth;

  const LinearProgressPainter({
    required this.backgroundColor,
    required this.valueColor,
    required this.percent,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    /// background
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..color = backgroundColor;
    canvas.drawLine(
      Offset(0, strokeWidth / 2),
      Offset(size.width, strokeWidth / 2),
      paint,
    );

    /// progress
    final progress = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..color = valueColor;

    if (percent != 0) {
      canvas.drawLine(
        Offset(0, strokeWidth / 2),
        Offset(
          (size.width * percent / 100).truncateToDouble(),
          strokeWidth / 2,
        ),
        progress,
      );
    }
  }

  @override
  bool shouldRepaint(covariant LinearProgressPainter oldDelegate) =>
      oldDelegate.backgroundColor != backgroundColor ||
      oldDelegate.valueColor != valueColor ||
      oldDelegate.percent != percent ||
      oldDelegate.strokeWidth != strokeWidth;
}
