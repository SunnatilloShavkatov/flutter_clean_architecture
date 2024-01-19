part of 'themes.dart';

class ThemeCustomShapes extends ThemeExtension<ThemeCustomShapes> {
  const ThemeCustomShapes({
    this.topRectangleBorder,
    this.bottomRectangleBorder,
    required this.buttonDecoration,
    required this.buttonsShadowDecoration,
  });

  final OutlinedBorder? topRectangleBorder;
  final OutlinedBorder? bottomRectangleBorder;
  final Decoration buttonDecoration;
  final Decoration buttonsShadowDecoration;

  static const ThemeCustomShapes light = ThemeCustomShapes(
    topRectangleBorder: CustomRectangleBorder(
      isTop: true,
      side: BorderSide(color: Color(0xFF343434)),
    ),
    bottomRectangleBorder: CustomRectangleBorder(
      isBottom: true,
      side: BorderSide(color: Color(0xFF343434)),
    ),
    buttonDecoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      gradient: LinearGradient(
        colors: [Color(0xFF2277F6), Color(0xFF1364DD)],
        stops: [0.0, 1.0],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    buttonsShadowDecoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      gradient: LinearGradient(
        colors: [Color(0xFF2277F6), Color(0xFF1364DD)],
        stops: [0.0, 1.0],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(255, 255, 255, 0.25),
          offset: Offset(0, 1),
          blurStyle: BlurStyle.inner,
        ),
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0, -1),
          blurStyle: BlurStyle.inner,
        ),
      ],
    ),
  );

  static const ThemeCustomShapes dark = ThemeCustomShapes(
    topRectangleBorder: CustomRectangleBorder(
      isTop: true,
      side: BorderSide(color: Color(0xFF343434)),
    ),
    bottomRectangleBorder: CustomRectangleBorder(
      isBottom: true,
      side: BorderSide(color: Color(0xFF343434)),
    ),
    buttonDecoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      gradient: LinearGradient(
        colors: [Color(0xFF2277F6), Color(0xFF1364DD)],
        stops: [0.0, 1.0],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    buttonsShadowDecoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      gradient: LinearGradient(
        colors: [Color(0xFF2277F6), Color(0xFF1364DD)],
        stops: [0.0, 1.0],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(255, 255, 255, 0.25),
          offset: Offset(0, 1),
          blurStyle: BlurStyle.inner,
        ),
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0, -1),
          blurStyle: BlurStyle.inner,
        ),
      ],
    ),
  );

  @override
  ThemeExtension<ThemeCustomShapes> copyWith({
    CustomRectangleBorder? topRectangleBorder,
    CustomRectangleBorder? bottomRectangleBorder,
    Decoration? buttonDecoration,
    Decoration? buttonsShadowDecoration,
  }) =>
      ThemeCustomShapes(
        topRectangleBorder: topRectangleBorder ?? this.topRectangleBorder,
        bottomRectangleBorder:
            bottomRectangleBorder ?? this.bottomRectangleBorder,
        buttonDecoration: buttonDecoration ?? this.buttonDecoration,
        buttonsShadowDecoration:
            buttonsShadowDecoration ?? this.buttonsShadowDecoration,
      );

  @override
  ThemeExtension<ThemeCustomShapes> lerp(
    ThemeExtension<ThemeCustomShapes>? other,
    double t,
  ) {
    if (other is! ThemeCustomShapes) {
      return this;
    }
    return ThemeCustomShapes(
      topRectangleBorder: OutlinedBorder.lerp(
        other.topRectangleBorder,
        topRectangleBorder,
        t,
      ),
      bottomRectangleBorder: OutlinedBorder.lerp(
        other.bottomRectangleBorder,
        bottomRectangleBorder,
        t,
      ),
      buttonDecoration: Decoration.lerp(
        other.buttonDecoration,
        buttonDecoration,
        t,
      )!,
      buttonsShadowDecoration: Decoration.lerp(
        other.buttonsShadowDecoration,
        buttonsShadowDecoration,
        t,
      )!,
    );
  }
}
