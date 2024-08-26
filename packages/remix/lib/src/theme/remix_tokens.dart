import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import 'remix_theme.dart';

final $rx = _RemixTokenRef();

class _RemixTokenRef {
  final color = RemixColors();
  final space = RemixSpace();
  final radii = RemixRadius();
  final text = RemixTypography();

  _RemixTokenRef();
}

// final _baseRemixTokens = MixThemeData(
//   colors: remixColorTokens,
//   spaces: remixSpaceTokens,
//   textStyles: remixTextTokens,
//   radii: remixRadiusTokens,
// );

// final _lightRemixTokens = _baseRemixTokens;
// final _darkRemixTokens = _baseRemixTokens.copyWith(
//   colors: remixDarkColorTokens,
// );

class RemixTokens {
  final Map<ColorToken, Color> colors;
  final Map<TextStyleToken, TextStyle> textStyles;
  final Map<SpaceToken, double> spaces;
  final Map<RadiusToken, Radius> radii;

  const RemixTokens({
    required this.colors,
    required this.textStyles,
    required this.spaces,
    required this.radii,
  });

  MixThemeData toThemeData() {
    return MixThemeData(
      colors: colors,
      spaces: spaces,
      textStyles: textStyles,
      radii: radii,
    );
  }
}

extension ColorUtilityX<T extends Attribute> on ColorUtility<T> {
  T $black() => ref($rx.color.black());
  T $white() => ref($rx.color.white());
  T $neutral([int? step]) => ref($rx.color.neutral(step));
  T $neutralAlpha([int? step]) => ref($rx.color.neutralAlpha(step));
  T $accent([int? step]) => ref($rx.color.accent(step));
  T $accentAlpha([int? step]) => ref($rx.color.accentAlpha(step));
}

extension SpacingSideUtilityX<T extends Attribute> on SpacingSideUtility<T> {
  T $space(int step) => ref($rx.space(step));
}

extension GapUtilityX<T extends Attribute> on GapUtility<T> {
  T $space(int step) => ref($rx.space(step));
}

extension TextStyleUtilityX<T extends Attribute> on TextStyleUtility<T> {
  T $text(int level) => ref($rx.text(level));
}
