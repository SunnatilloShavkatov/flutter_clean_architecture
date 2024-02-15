import 'package:flutter/material.dart';

import 'circular_progress_indicator.dart';

class ModalProgressHUD extends StatelessWidget {
  const ModalProgressHUD({
    super.key,
    this.inAsyncCall = false,
    this.opacity = 0.3,
    this.color = Colors.transparent,
    this.progressIndicator = const CustomCircularProgressIndicator(),
    this.dismissible = false,
    required this.child,
  });

  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final bool dismissible;
  final Widget child;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          child,
          Offstage(
            offstage: !inAsyncCall,
            child: Opacity(
              opacity: opacity,
              child: ModalBarrier(dismissible: dismissible, color: color),
            ),
          ),
          Offstage(
            offstage: !inAsyncCall,
            child: Center(child: progressIndicator),
          ),
        ],
      );
}
