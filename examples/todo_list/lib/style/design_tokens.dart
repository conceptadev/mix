import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mix/mix.dart';

const _color = ColorTokens();
const _textStyle = TextStyleTokens();
final lightTheme = MixThemeData(
  colors: {
    _color.surface: Colors.white,
    _color.onSurface: const Color(0xFF141217),
    _color.onSurfaceVariant: const Color.fromARGB(255, 74, 70, 81),
    _color.surfaceContainer: const Color(0xFFE0DBE5),
    _color.outline: const Color(0xFFE0DBE5),
    _color.primary: const Color(0xFF7326E0),
    _color.onPrimary: Colors.white,
  },
  textStyles: {
    _textStyle.heading1: GoogleFonts.manrope(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    _textStyle.heading2: GoogleFonts.manrope(
      fontSize: 23,
      fontWeight: FontWeight.bold,
    ),
    _textStyle.heading3: GoogleFonts.manrope(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    _textStyle.body: GoogleFonts.manrope(
      fontSize: 14,
      fontWeight: FontWeight.w200,
    ),
  },
);

class ColorTokens {
  const ColorTokens();
  final surface = const ColorToken('surface');
  final onSurface = const ColorToken('on.surface');
  final surfaceContainer = const ColorToken('surface.container');
  final onSurfaceVariant = const ColorToken('on.surface.variant');
  final primary = const ColorToken('primary');
  final onPrimary = const ColorToken('on.primary');
  final outline = const ColorToken('outline');
}

class TextStyleTokens {
  const TextStyleTokens();
  final heading1 = const TextStyleToken('heading1');
  final heading2 = const TextStyleToken('heading2');
  final heading3 = const TextStyleToken('heading3');
  final body = const TextStyleToken('body');
}
