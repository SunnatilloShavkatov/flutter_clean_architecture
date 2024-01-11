part of 'extension.dart';

extension SizeExtension on BuildContext {
  bool get isMobile =>
      kSize.width < 600 && (Platform.isAndroid || Platform.isIOS);

  bool get isTablet =>
      kSize.width > 600 && (Platform.isAndroid || Platform.isIOS);

  Size get kSize => MediaQuery.sizeOf(this);

  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  EdgeInsets get padding => MediaQuery.paddingOf(this);
}

extension OrientationExtension on Orientation {
  bool get isPortrait => this == Orientation.portrait;
}
