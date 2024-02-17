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
  final ImageWidgetBuilder? imageBuilder;
  final PlaceholderWidgetBuilder? placeholder;
  final ProgressIndicatorBuilder? progressIndicatorBuilder;
  final LoadingErrorWidgetBuilder? errorWidget;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        memCacheWidth: width == null
            ? null
            : (width! * context.devicePixelRatio).toInt(),
        memCacheHeight: height == null
            ? null
            : (height! * context.devicePixelRatio).toInt(),
        fit: fit,
        placeholder: placeholder,
        errorWidget: errorWidget,
        progressIndicatorBuilder: progressIndicatorBuilder,
        imageBuilder: imageBuilder,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty("imageUrl", imageUrl))
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
      )
      ..add(DoubleProperty("width", width))
      ..add(DoubleProperty("height", height))
      ..add(EnumProperty<BoxFit?>("fit", fit));
  }
}
