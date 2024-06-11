import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mix/mix.dart';

final lightTheme = MixThemeData(
  colors: {
    $token.color.surface: Colors.white,
    $token.color.onSurface: const Color(0xFF141217),
    $token.color.onSurfaceVariant: const Color.fromARGB(255, 74, 70, 81),
    $token.color.surfaceContainer: const Color(0xFFE0DBE5),
    $token.color.outline: const Color(0xFFE0DBE5),
    $token.color.primary: const Color(0xFF7326E0),
    $token.color.onPrimary: Colors.white,
  },
  textStyles: {
    $token.textStyle.heading1: GoogleFonts.manrope(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    $token.textStyle.heading2: GoogleFonts.manrope(
      fontSize: 23,
      fontWeight: FontWeight.bold,
    ),
    $token.textStyle.heading3: GoogleFonts.manrope(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    $token.textStyle.body: GoogleFonts.manrope(
      fontSize: 14,
      fontWeight: FontWeight.w200,
    ),
  },
);

extension ColorExt on ColorTokenUtil {
  ColorToken get surface => const ColorToken('surface');
  ColorToken get onSurface => const ColorToken('on.surface');
  ColorToken get surfaceContainer => const ColorToken('surface.container');
  ColorToken get onSurfaceVariant => const ColorToken('on.surface.variant');
  ColorToken get primary => const ColorToken('primary');
  ColorToken get onPrimary => const ColorToken('on.primary');
  ColorToken get outline => const ColorToken('outline');
}

extension TextStyleExt on TextStyleTokenUtil {
  TextStyleToken get heading1 => const TextStyleToken('heading1');
  TextStyleToken get heading2 => const TextStyleToken('heading2');
  TextStyleToken get heading3 => const TextStyleToken('heading3');
  TextStyleToken get body => const TextStyleToken('body');
}
