part of '../remix_tokens.dart';

class RemixColors {
  final _blackColor = const ColorToken('--black');
  final _whiteColor = const ColorToken('--white');
  final _accentSwatch = ColorSwatchToken.scale('--accent', 12);
  final _accentAlphaSwatch = ColorSwatchToken.scale('--accent-alpha', 12);

  final _neutralSwatch = ColorSwatchToken.scale('--neutral', 12);
  final _neutralAlphaSwatch = ColorSwatchToken.scale('--neutral-alpha', 12);

  RemixColors();

  ColorToken black() => _blackColor;
  ColorToken white() => _whiteColor;

  ColorToken accent([int? step]) {
    return step == null ? _accentSwatch : _accentSwatch[step];
  }

  ColorToken accentAlpha([int? step]) {
    return step == null ? _accentAlphaSwatch : _accentAlphaSwatch[step];
  }

  ColorToken neutral([int? step]) {
    return step == null ? _neutralSwatch : _neutralSwatch[step];
  }

  ColorToken neutralAlpha([int? step]) {
    return step == null ? _neutralAlphaSwatch : _neutralAlphaSwatch[step];
  }
}

Map<ColorToken, Color> _mapColorRadixTokens({
  required RadixColors accent,
  required RadixColors neutral,
}) {
  final remix = RemixColors();

  return {
    remix._whiteColor: const Color(0xFFFFFFFF),
    remix._blackColor: const Color(0xFF1C2024),
    remix._accentSwatch: accent.swatch,
    remix._accentAlphaSwatch: accent.alphaSwatch,
    remix._neutralSwatch: neutral.swatch,
    remix._neutralAlphaSwatch: neutral.alphaSwatch,
  };
}

final remixColorTokens = _mapColorRadixTokens(
  accent: RadixColors.indigo,
  neutral: RadixColors.slate,
);
final remixDarkColorTokens = _mapColorRadixTokens(
  accent: RadixColors.indigoDark,
  neutral: RadixColors.slateDark,
);

extension ColorUtilityX<T extends Attribute> on ColorUtility<T> {
  T $black() => ref($rx.color.black());
  T $white() => ref($rx.color.white());
  T $neutral([int? step]) => ref($rx.color.neutral(step));
  T $neutralAlpha([int? step]) => ref($rx.color.neutralAlpha(step));
  T $accent([int? step]) => ref($rx.color.accent(step));
  T $accentAlpha([int? step]) => ref($rx.color.accentAlpha(step));
}
