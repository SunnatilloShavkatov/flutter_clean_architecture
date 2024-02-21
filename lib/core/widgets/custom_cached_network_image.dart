import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "package:flutter_clean_architecture/core/extension/extension.dart";

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    required this.imageUrl,
    super.key,
    this.imageBuilder,
    this.placeholder,
    this.progressIndicatorBuilder,
    this.errorWidget,
    this.width,
    this.height,
    this.fit,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final ImageWidgetBuilder? imageBuilder;
  final PlaceholderWidgetBuilder? placeholder;
  final ProgressIndicatorBuilder? progressIndicatorBuilder;
  final LoadingErrorWidgetBuilder? errorWidget;

  @override
  Widget build(BuildContext context) {
    final int? cacheWidth =
        width == null ? null : (width! * context.devicePixelRatio).toInt();
    final int? cacheHeight =
        height == null ? null : (height! * context.devicePixelRatio).toInt();
    return CachedNetworkImage(
      cacheKey: imageUrl,
      imageUrl: imageUrl,
      width: width,
      height: height,
      memCacheWidth: cacheWidth,
      memCacheHeight: cacheHeight,
      maxWidthDiskCache: cacheWidth,
      maxHeightDiskCache: cacheHeight,
      fit: fit,
      placeholder: placeholder,
      errorWidget: errorWidget,
      progressIndicatorBuilder: progressIndicatorBuilder,
      imageBuilder: imageBuilder,
      placeholderFadeInDuration: const Duration(milliseconds: 300),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty("imageUrl", imageUrl))
      ..add(DoubleProperty("width", width))
      ..add(DoubleProperty("height", height))
      ..add(EnumProperty<BoxFit?>("fit", fit))
      ..add(
        ObjectFlagProperty<ImageWidgetBuilder?>.has(
          "imageBuilder",
          imageBuilder,
        ),
      )
      ..add(
        ObjectFlagProperty<PlaceholderWidgetBuilder?>.has(
          "placeholder",
          placeholder,
        ),
      )
      ..add(
        ObjectFlagProperty<ProgressIndicatorBuilder?>.has(
          "progressIndicatorBuilder",
          progressIndicatorBuilder,
        ),
      )
      ..add(
        ObjectFlagProperty<LoadingErrorWidgetBuilder?>.has(
          "errorWidget",
          errorWidget,
        ),
      );
  }
}
