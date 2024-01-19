part of 'package:flutter_clean_architecture/core/theme/themes.dart';

class ThemeGradients extends ThemeExtension<ThemeGradients> {
  const ThemeGradients({
    required this.buttonLinearGradient,
  });

  final LinearGradient buttonLinearGradient;

  static const light = ThemeGradients(
    buttonLinearGradient: LinearGradient(
      colors: [Color(0xFF2277F6), Color(0xFF1364DD)],
      stops: [0.0, 1.0],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );
  static const dark = ThemeGradients(
    buttonLinearGradient: LinearGradient(
      colors: [Color(0xFF2277F6), Color(0xFF1364DD)],
      stops: [0.0, 1.0],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );

  @override
  ThemeExtension<ThemeGradients> copyWith({
    LinearGradient? buttonLinearGradient,
  }) =>
      ThemeGradients(
        buttonLinearGradient: buttonLinearGradient ?? this.buttonLinearGradient,
      );

  @override
  ThemeExtension<ThemeGradients> lerp(
    ThemeExtension<ThemeGradients>? other,
    double t,
  ) {
    if (other is! ThemeGradients) {
      return this;
    }
    return ThemeGradients(
      buttonLinearGradient: LinearGradient.lerp(
        buttonLinearGradient,
        other.buttonLinearGradient,
        t,
      )!,
    );
  }
}

extension BuildContextZ on BuildContext {
  ThemeGradients get gradients => Theme.of(this).extension<ThemeGradients>()!;
}
