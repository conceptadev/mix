import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import '../helpers/color_palette.dart';

part 'tokens/color_tokens.dart';
part 'tokens/radius_tokens.dart';
part 'tokens/space_tokens.dart';
part 'tokens/text_style_tokens.dart';

final $rx = _RemixTokenRef();

class _RemixTokenRef {
  final color = RemixColors();
  final space = RemixSpace();
  final radii = RemixRadius();
  final text = RemixTypography();

  _RemixTokenRef();
}

final light = RemixTokens(
  colors: remixColorTokens,
  textStyles: remixTextTokens,
  spaces: remixSpaceTokens,
  radii: remixRadiusTokens,
);

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
