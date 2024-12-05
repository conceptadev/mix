import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../helpers/color_palette.dart';

part 'tokens.g.dart';

class FortalezaTokens {
  final FortalezaColor colors;
  final FortalezaRadius radii;
  final FortalezaSpace spaces;
  final FortalezaTextStyle textStyles;

  const FortalezaTokens({
    required this.colors,
    required this.radii,
    required this.spaces,
    required this.textStyles,
  });

  factory FortalezaTokens.light() {
    return FortalezaTokens(
      colors: FortalezaColor(
        black: const Color(0xFF1C2024),
        white: const Color(0xFFFFFFFF),
        accent: RadixColors.indigo.swatch,
        accentAlpha: RadixColors.indigo.alphaSwatch,
        neutral: RadixColors.slate.swatch,
        neutralAlpha: RadixColors.slate.alphaSwatch,
      ),
      radii: FortalezaRadius.values(
        [4, 8, 12, 16, 24, 32],
      ),
      spaces: FortalezaSpace.values(
        [4, 8, 12, 16, 24, 32, 40, 48, 64],
      ),
      textStyles: const FortalezaTextStyle(
        text1: TextStyle(fontSize: 12, letterSpacing: 0.0025, height: 1.33),
        text2: TextStyle(fontSize: 14, letterSpacing: 0, height: 1.43),
        text3: TextStyle(fontSize: 16, letterSpacing: 0, height: 1.50),
        text4: TextStyle(fontSize: 18, letterSpacing: -0.0025, height: 1.44),
        text5: TextStyle(fontSize: 20, letterSpacing: -0.005, height: 1.40),
        text6: TextStyle(fontSize: 24, letterSpacing: -0.00625, height: 1.25),
        text7: TextStyle(fontSize: 28, letterSpacing: -0.0075, height: 1.29),
        text8: TextStyle(fontSize: 35, letterSpacing: -0.01, height: 1.14),
        text9: TextStyle(fontSize: 60, letterSpacing: -0.025, height: 1.00),
      ),
    );
  }

  factory FortalezaTokens.dark() {
    return FortalezaTokens.light().copyWith(
      colors: FortalezaColor(
        black: const Color(0xFF1C2024),
        white: const Color(0xFFFFFFFF),
        accent: RadixColors.indigoDark.swatch,
        accentAlpha: RadixColors.indigoDark.alphaSwatch,
        neutral: RadixColors.slateDark.swatch,
        neutralAlpha: RadixColors.slateDark.alphaSwatch,
      ),
    );
  }

  MixThemeData toThemeData() {
    return MixThemeData(
      colors: colors.toMap(),
      spaces: spaces.toMap(),
      textStyles: textStyles.toMap(),
      radii: radii.toMap(),
    );
  }

  FortalezaTokens copyWith({
    FortalezaColor? colors,
    FortalezaRadius? radii,
    FortalezaSpace? spaces,
    FortalezaTextStyle? textStyles,
  }) {
    return FortalezaTokens(
      colors: colors ?? this.colors,
      radii: radii ?? this.radii,
      spaces: spaces ?? this.spaces,
      textStyles: textStyles ?? this.textStyles,
    );
  }
}

@MixableToken(Color)
class FortalezaColor {
  final Color black;
  final Color white;

  @MixableSwatchColorToken(scale: 12, defaultValue: 9)
  final Color accent;
  @MixableSwatchColorToken(scale: 12, defaultValue: 9)
  final Color accentAlpha;
  @MixableSwatchColorToken(scale: 12, defaultValue: 9)
  final Color neutral;
  @MixableSwatchColorToken(scale: 12, defaultValue: 9)
  final Color neutralAlpha;

  const FortalezaColor({
    required this.black,
    required this.white,
    required this.accent,
    required this.accentAlpha,
    required this.neutral,
    required this.neutralAlpha,
  });

  Map<ColorToken, Color> toMap() => _$FortalezaColorToMap(this);
}

@MixableToken(Radius)
class FortalezaRadius {
  final Radius radius1;
  final Radius radius2;
  final Radius radius3;
  final Radius radius4;
  final Radius radius5;
  final Radius radius6;

  const FortalezaRadius({
    required this.radius1,
    required this.radius2,
    required this.radius3,
    required this.radius4,
    required this.radius5,
    required this.radius6,
  });

  factory FortalezaRadius.values(List<double> values) {
    assert(values.length == 6, 'Expected 6 values, got ${values.length}');
    return FortalezaRadius(
      radius1: Radius.circular(values[0]),
      radius2: Radius.circular(values[1]),
      radius3: Radius.circular(values[2]),
      radius4: Radius.circular(values[3]),
      radius5: Radius.circular(values[4]),
      radius6: Radius.circular(values[5]),
    );
  }

  Map<RadiusToken, Radius> toMap() => _$FortalezaRadiusToMap(this);
}

@MixableToken(double)
class FortalezaSpace {
  final double space1;
  final double space2;
  final double space3;
  final double space4;
  final double space5;
  final double space6;
  final double space7;
  final double space8;
  final double space9;

  const FortalezaSpace({
    required this.space1,
    required this.space2,
    required this.space3,
    required this.space4,
    required this.space5,
    required this.space6,
    required this.space7,
    required this.space8,
    required this.space9,
  });

  factory FortalezaSpace.values(List<double> values) {
    assert(values.length == 9, 'Expected 9 values, got ${values.length}');
    return FortalezaSpace(
      space1: values[0],
      space2: values[1],
      space3: values[2],
      space4: values[3],
      space5: values[4],
      space6: values[5],
      space7: values[6],
      space8: values[7],
      space9: values[8],
    );
  }

  Map<SpaceToken, double> toMap() => _$FortalezaSpaceToMap(this);
}

@MixableToken(TextStyle)
class FortalezaTextStyle {
  final TextStyle text1;
  final TextStyle text2;
  final TextStyle text3;
  final TextStyle text4;
  final TextStyle text5;
  final TextStyle text6;
  final TextStyle text7;
  final TextStyle text8;
  final TextStyle text9;

  const FortalezaTextStyle({
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
    required this.text7,
    required this.text8,
    required this.text9,
  });

  Map<TextStyleToken, TextStyle> toMap() => _$FortalezaTextStyleToMap(this);
}
