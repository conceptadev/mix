import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'theme.g.dart';

@MixableToken(Color)
class ColorTokens {
  final Color primary;
  final Color secondary;
  final Color tertiary;

  const ColorTokens({
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  Map<ColorToken, Color> get data => _$ColorTokensToData(this);
}

@MixableToken(TextStyle)
class TextTokens {
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle body;

  const TextTokens({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.body,
  });

  Map<TextStyleToken, TextStyle> get data => _$TextTokensToData(this);
}

@MixableToken(Radius)
class RadiusTokens {
  final Radius small;
  final Radius medium;
  final Radius large;

  const RadiusTokens({
    required this.small,
    required this.medium,
    required this.large,
  });

  Map<RadiusToken, Radius> get data => _$RadiusTokensToData(this);
}

@MixableToken(double)
class SpaceTokens {
  final double p8;
  final double p16;
  final double p24;

  const SpaceTokens({
    required this.p8,
    required this.p16,
    required this.p24,
  });

  Map<SpaceToken, double> get data => _$SpaceTokensToData(this);
}
