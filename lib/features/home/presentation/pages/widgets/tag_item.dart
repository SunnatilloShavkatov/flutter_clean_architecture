import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';

class TagItem extends StatelessWidget {
  const TagItem({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {},
        customBorder: context.shapes.circleBorder,
        child: Material(
          color: context.color.whiteOpacity05,
          shape: context.shapes.circleBorder,
          child: Padding(
            padding: AppUtils.kPaddingHor16Ver4,
            child: Text(
              text,
              style: const TextStyle(
                height: 20 / 12,
                fontSize: 12,
                color: Color(0xFFBFBFBF),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
}
