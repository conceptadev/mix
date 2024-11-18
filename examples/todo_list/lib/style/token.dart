import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'token.g.dart';

final theme = MixThemeData(
  colors: const MyThemeColorToken(
    primary: Colors.blue,
    onPrimary: Colors.white,
    surface: ColorSwatch(2, {
      1: Colors.blue,
      2: Colors.blue,
    }),
    onSurface: Colors.black,
    onSurfaceVariant: Colors.grey,
  ).toMap,
);

@MixableToken(
  Color,
  namespace: 'c',
)
class MyThemeColorToken {
  final Color primary;
  final Color onPrimary;
  final Color onSurface;

  @MixableSwatchColorToken(scale: 12)
  final Color onSurfaceVariant;

  final ColorSwatch surface;

  const MyThemeColorToken({
    required this.primary,
    required this.onPrimary,
    required this.surface,
    required this.onSurface,
    required this.onSurfaceVariant,
  });

  Map<ColorToken, Color> get toMap => _$MyThemeColorTokenToMap(this);
}

@MixableToken(
  TextStyle,
  utilityExtension: false,
  contextExtension: false,
)
class MyThemeTextStyleToken {
  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle headline3;
  final TextStyle body;
  final TextStyle callout;

  const MyThemeTextStyleToken({
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.body,
    required this.callout,
  });

  Map<TextStyleToken, TextStyle> get toMap =>
      _$MyThemeTextStyleTokenToMap(this);
}

@MixableToken(Radius)
class MyThemeRadiusToken {
  const MyThemeRadiusToken({
    required this.large,
    required this.medium,
  });

  final Radius large;
  final Radius medium;

  Map<RadiusToken, Radius> get toMap => _$MyThemeRadiusTokenToMap(this);
}

@MixableToken(double)
class MyThemeSpaceToken {
  const MyThemeSpaceToken({
    required this.medium,
    required this.large,
  });

  final double medium;
  final double large;

  Map<SpaceToken, double> get toMap => _$MyThemeSpaceTokenToMap(this);
}

final lightBlueTheme = MixThemeData(
  colors: const MyThemeColorToken(
    primary: Color(0xFF0093B9),
    onPrimary: Color(0xFFFAFAFA),
    surface: ColorSwatch(0xFFFAFAFA, {
      1: Color(0xFFFAFAFA),
      2: Color(0xFFFAFAFA),
    }),
    onSurface: Color(0xFF141C24),
    onSurfaceVariant: Color(0xFF405473),
  ).toMap,
  textStyles: MyThemeTextStyleToken(
    headline1: GoogleFonts.plusJakartaSans(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    headline2: GoogleFonts.plusJakartaSans(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    headline3: GoogleFonts.plusJakartaSans(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    body: GoogleFonts.plusJakartaSans(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    callout: GoogleFonts.plusJakartaSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  ).toMap,
  radii: const MyThemeRadiusToken(
    large: Radius.circular(100),
    medium: Radius.circular(12),
  ).toMap,
  spaces: const MyThemeSpaceToken(
    medium: 16,
    large: 24,
  ).toMap,
);
