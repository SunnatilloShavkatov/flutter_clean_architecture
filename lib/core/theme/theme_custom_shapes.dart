part of 'themes.dart';

class ThemeCustomShapes extends ThemeExtension<ThemeCustomShapes> {
  const ThemeCustomShapes({
    this.topRectangleBorder,
    this.bottomRectangleBorder,
  });

  final OutlinedBorder? topRectangleBorder;
  final OutlinedBorder? bottomRectangleBorder;

  static const ThemeCustomShapes light = ThemeCustomShapes(
    topRectangleBorder: CustomRectangleBorder(
      isTop: true,
      side: BorderSide(color: Color(0xFF343434)),
    ),
    bottomRectangleBorder: CustomRectangleBorder(
      isBottom: true,
      side: BorderSide(color: Color(0xFF343434)),
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
  );

  @override
  ThemeExtension<ThemeCustomShapes> copyWith({
    CustomRectangleBorder? topRectangleBorder,
    CustomRectangleBorder? bottomRectangleBorder,
  }) =>
      ThemeCustomShapes(
        topRectangleBorder: topRectangleBorder ?? this.topRectangleBorder,
        bottomRectangleBorder:
            bottomRectangleBorder ?? this.bottomRectangleBorder,
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
    );
  }
}
