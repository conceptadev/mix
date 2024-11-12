import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'theme.g.dart';

@MixableToken()
class ColorTokens {
  final Color primary;
  final Color secondary;
  final Color tertiary;

  const ColorTokens({
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  Map<ColorToken, Color> get data => _$TokensToData(this);
}

@MixableToken()
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
}

class ColorStruct {
  final Color p10;
  final Color p20;
  final Color p30;

  const ColorStruct(this.p10, this.p20, this.p30);
}
