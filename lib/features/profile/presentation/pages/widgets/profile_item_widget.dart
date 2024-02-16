import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "package:flutter_clean_architecture/core/extension/extension.dart";
import "package:flutter_clean_architecture/core/theme/themes.dart";
import "package:flutter_clean_architecture/core/utils/utils.dart";

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    required this.leading,
    required this.title,
    super.key,
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
              children: <Widget>[
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty("title", title))
      ..add(ObjectFlagProperty<GestureTapCallback?>.has("onTap", onTap))
      ..add(DiagnosticsProperty<ShapeBorder?>("shape", shape));
  }
}
