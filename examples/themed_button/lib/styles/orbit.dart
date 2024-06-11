import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:themed_button/styles/tokens.dart';

final orbitTheme = MixThemeData(
  colors: {
    $token.color.primary: const Color(0xff00A58E),
    $token.color.primaryHover: const Color(0xFF009580),
    $token.color.onPrimary: Colors.white,
  },
  radii: {
    $token.radius.small: const Radius.circular(4),
    $token.radius.normal: const Radius.circular(6),
    $token.radius.large: const Radius.circular(12),
    $token.radius.full: const Radius.circular(9999),
  },
  spaces: {
    $token.space.xxxsmall: 4,
    $token.space.xxsmall: 8,
    $token.space.xsmall: 12,
    $token.space.small: 16,
    $token.space.medium: 24,
    $token.space.large: 32,
  },
  textStyles: {
    $token.textStyle.small: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    $token.textStyle.normal: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    $token.textStyle.large: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    )
  },
);
