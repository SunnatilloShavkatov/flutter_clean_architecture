import 'package:flutter/material.dart';

import '../../../../../core/theme/themes.dart';
import '../../../../../core/utils/utils.dart';

class TitleRight extends StatelessWidget {
  const TitleRight({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingHor16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            IconButton(
              onPressed: onPressed,
              constraints: const BoxConstraints.tightFor(
                width: 36,
                height: 36,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.white.withOpacity(0.1),
                ),
                padding: const MaterialStatePropertyAll(EdgeInsets.zero),
              ),
              icon: const Icon(AppIcons.arrow_right),
            ),
          ],
        ),
      );
}
