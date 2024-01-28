import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/theme/themes.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    super.key,
    required this.leading,
    required this.title,
    this.onTap,
    this.shape,
  });

  final Widget leading;
  final Widget title;
  final GestureTapCallback? onTap;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) => ListTile(
    onTap: onTap,
    shape: shape,
    title: title,
    style: ListTileStyle.list,
    leading: IconTheme(
      data: context.theme.iconTheme.copyWith(
        color: context.colorScheme.primary,
      ),
      child: leading,
    ),
    trailing: Icon(
      AppIcons.arrow_right,
      color: context.colorScheme.onBackground,
    ),
  );
}
