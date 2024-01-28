import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/theme/themes.dart';
import '../../../../../core/utils/utils.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    super.key,
    required this.leading,
    required this.title,
    this.onTap,
    this.shape,
  });

  final Widget leading;
  final String title;
  final GestureTapCallback? onTap;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) => Material(
        shape: shape,
        child: InkWell(
          onTap: onTap,
          customBorder: shape,
          child: Padding(
            padding: AppUtils.kPaddingAll12,
            child: Row(
              children: [
                IconTheme(
                  data: context.theme.iconTheme.copyWith(
                    color: context.colorScheme.primary,
                  ),
                  child: leading,
                ),
                AppUtils.kGap8,
                Expanded(
                  child: Text(
                    title,
                    style: context.theme.listTileTheme.titleTextStyle,
                  ),
                ),
                Icon(
                  AppIcons.arrow_right,
                  color: context.colorScheme.onBackground,
                ),
              ],
            ),
          ),
        ),
      );
}
