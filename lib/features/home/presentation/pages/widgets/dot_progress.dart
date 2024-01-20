import 'package:flutter/material.dart';

import '../../../../../core/widgets/anim/simple_circular_progress_bar.dart';

class DotProgress extends StatelessWidget {
  const DotProgress({
    super.key,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          AnimatedContainer(
            margin: const EdgeInsets.all(3),
            duration: const Duration(milliseconds: 500),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: isLoading
                  ? Colors.white
                  : const Color.fromRGBO(255, 255, 255, 0.5),
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            width: 12,
            height: 12,
            child: Visibility(
              visible: isLoading,
              child: const SimpleCircularProgressBar(
                animationDuration: 5,
                size: 12,
                backStrokeWidth: 1,
                progressStrokeWidth: 1,
                progressColors: [Colors.white],
                fullProgressColor: Colors.white,
                mergeMode: true,
              ),
            ),
          ),
        ],
      );
}
