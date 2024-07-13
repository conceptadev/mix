import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:themed_button/styles/tokens.dart';

final _color = ColorTokens();
final _radius = RadiusTokens();
final _space = SpaceTokens();
final _textStyle = TextStyleTokens();
final orbitTheme = MixThemeData(
  colors: {
    _color.primary: const Color(0xff00A58E),
    _color.primaryHover: const Color(0xFF009580),
    _color.onPrimary: Colors.white,
  },
  radii: {
    _radius.small: const Radius.circular(4),
    _radius.normal: const Radius.circular(6),
    _radius.large: const Radius.circular(12),
    _radius.full: const Radius.circular(9999),
  },
  spaces: {
    _space.xxxsmall: 4,
    _space.xxsmall: 8,
    _space.xsmall: 12,
    _space.small: 16,
    _space.medium: 24,
    _space.large: 32,
  },
  textStyles: {
    _textStyle.small: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    _textStyle.normal: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    _textStyle.large: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    )
  },
);
