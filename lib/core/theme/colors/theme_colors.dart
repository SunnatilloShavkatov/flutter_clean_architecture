part of 'package:flutter_clean_architecture/core/theme/themes.dart';

/// A set of colors for the entire app.
const colorLightScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF007AFF),
  onPrimary: Colors.white,
  surface: Colors.white,
  onSurface: Color(0xFF020000),
  secondary: Color(0xFF69D7C7),
  onSecondary: Color(0xFF020000),
  error: Color(0xFFE30021),
  onError: Colors.white,
  surfaceVariant: Color(0xFFF5F5F5),
  background: Color(0xFFF3F6FB),
  onBackground: Color(0xFF020000),
);

///
const colorDarkScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF007AFF),
  onPrimary: Colors.white,
  surface: Color(0xFFF7F9FC),
  onSurface: Color(0xFF020000),
  secondary: Color(0xFF69D7C7),
  onSecondary: Color(0xFF020000),
  error: Color(0xFFD93F2F),
  onError: Colors.white,
  background: Color(0xFFF3F6FB),
  onBackground: Color(0xFF020000),
);

class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.main,
    required this.cardColor,
    required this.green,
  });

  final Color main;
  final Color cardColor;
  final Color green;

  static const ThemeColors light = ThemeColors(
    main: Color(0xFF2B2B30),
    green: Color(0xFF32B141),
    cardColor: Colors.white,
  );

  static const ThemeColors dark = ThemeColors(
    main: Color(0xFF2B2B30),
    green: Color(0xFF32B141),
    cardColor: Color(0xFF1E1E1E),
  );

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? cardColor,
    Color? main,
    Color? green,
  }) =>
      ThemeColors(
        green: green ?? this.green,
        cardColor: cardColor ?? this.cardColor,
        main: main ?? this.main,
      );

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }
    return ThemeColors(
      green: Color.lerp(green, other.green, t)!,
      main: Color.lerp(main, other.main, t)!,
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
    );
  }
}
