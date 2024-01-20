import 'package:flutter/material.dart';

class RotateLoading extends StatelessWidget {
  const RotateLoading({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => RotateIcon(
        duration: const Duration(seconds: 1),
        child: child,
      );
}

/// Class use to render an animated icon with rotation
class RotateIcon extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const RotateIcon({super.key, required this.child, required this.duration});

  @override
  State<RotateIcon> createState() => _RotateIconState();
}

class _RotateIconState extends State<RotateIcon>
    with SingleTickerProviderStateMixin {
  /// Controller to animate the children
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _animationController = AnimationController(
        vsync: this,
        duration: widget.duration,
      );
      _animationController.repeat();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _animationController,
        child: widget.child,
        builder: (_, Widget? widget) => Transform.rotate(
          angle: _animationController.value * 6.3,
          child: widget,
        ),
      );
}
