import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "package:flutter_clean_architecture/core/theme/themes.dart";
import "package:flutter_clean_architecture/core/utils/utils.dart";

class TitleRight extends StatelessWidget {
  const TitleRight({
    required this.title,
    super.key,
    this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingHor16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title),
            IconButton(
              onPressed: onPressed,
              constraints: const BoxConstraints.tightFor(
                width: 36,
                height: 36,
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(
                  Colors.white.withOpacity(0.1),
                ),
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.zero,
                ),
              ),
              icon: const Icon(AppIcons.arrow_right),
            ),
          ],
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty("title", title))
      ..add(ObjectFlagProperty<VoidCallback?>.has("onPressed", onPressed));
  }
}
