import 'package:flutter/material.dart';

import '../../extension/extension.dart';

enum CustomLabelButton { label, icon }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
  });

  final Widget label;
  final Widget? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(8));

    /// Label
    final Widget labelA = DefaultTextStyle(
      style: const TextStyle(
        height: 20 / 15,
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      child: label,
    );

    /// Icon
    final Widget childA;
    if (icon != null) {
      childA = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          labelA,
          const SizedBox(width: 8),
          IconTheme(
            data: const IconThemeData(color: Colors.white, size: 20),
            child: icon!,
          ),
        ],
      );
    } else {
      childA = labelA;
    }
    return InkWell(
      onTap: onPressed,
      borderRadius: borderRadius,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: DecoratedBox(
        decoration: context.shapes.buttonDecoration,
        child: Container(
          margin: const EdgeInsets.all(1),
          decoration: context.shapes.buttonsShadowDecoration,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: childA,
        ),
      ),
    );
  }
}
