import "dart:ui";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "package:flutter_clean_architecture/core/utils/utils.dart";
import "package:flutter_clean_architecture/core/widgets/custom_cached_network_image.dart";

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white.withOpacity(0.1),
            ),
            borderRadius: AppUtils.kBorderRadius8,
          ),
        ),
        child: const Stack(
          children: <Widget>[
            Positioned(
              left: 56,
              top: -81,
              child: ClipRRect(
                borderRadius: AppUtils.kBorderRadius8,
                child: CustomCachedNetworkImage(
                  imageUrl:
                      "https://firebasestorage.googleapis.com/v0/b/sample-bloc-5b8b9.appspot.com/o/image_29.webp?alt=media",
                  width: 342,
                  height: 237,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius8,
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF002358),
                      Color(0xFF171249),
                      Color(0xB91E0D45),
                      Color(0x00310039),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: AppUtils.kPaddingAll12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Неизвестный пользователь",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _Item("Ваш тариф: Неизвестно"),
                      SizedBox(width: 6),
                      _Item("Баланс: Неизвестно"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _Item extends StatelessWidget {
  const _Item(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: AppUtils.kBorderRadius4,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: ShapeDecoration(
              color: Colors.black.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.white.withOpacity(0.1),
                ),
                borderRadius: AppUtils.kBorderRadius4,
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty("text", text));
  }
}
