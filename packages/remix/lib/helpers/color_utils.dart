import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

extension ColorUtilityX<T extends Attribute> on ColorUtility<T> {
  T alphaBlend(Color foreground, Color background) =>
      call(Color.alphaBlend(foreground, background));
}

double _calculateContrast(Color backgroundColor, Color textColor) {
  /// Calculates the contrast ratio between two colors.
  ///
  /// The contrast ratio is a measure of the perceived difference in brightness
  /// between the text color and the background color. A higher ratio indicates
  /// better readability.
  ///
  /// The calculation involves:
  /// 1. Computing the relative luminance of each color.
  /// 2. Finding the lighter (brightest) and darker (darkest) colors.
  /// 3. Applying the contrast ratio formula: (brightest + 0.05) / (darkest + 0.05)
  ///
  /// Note: Relative luminance calculation is computationally expensive.
  var lum1 = textColor.computeLuminance();
  var lum2 = backgroundColor.computeLuminance();

  var brightest = math.max(lum1, lum2);
  var darkest = math.min(lum1, lum2);

  return (brightest + 0.05) / (darkest + 0.05);
}

class RXColor {
  final Color color;
  final ColorSwatch<int> swatch;

  RXColor(this.color) : swatch = getColorSwatch(color);

  Color get shade50 => swatch[50]!;
  Color get shade100 => swatch[100]!;
  Color get shade200 => swatch[200]!;
  Color get shade300 => swatch[300]!;
  Color get shade400 => swatch[400]!;
  Color get shade500 => swatch[500]!;
  Color get shade600 => swatch[600]!;
  Color get shade700 => swatch[700]!;
  Color get shade800 => swatch[800]!;
  Color get shade900 => swatch[900]!;
}

ColorSwatch<int> getColorSwatch(Color color) {
  final hslColor = HSLColor.fromColor(color);
  final lightness = hslColor.lightness;

  /// if [500] is the default color, there are at LEAST five
  /// steps below [500]. (i.e. 400, 300, 200, 100, 50.) A
  /// divisor of 5 would mean [50] is a lightness of 1.0 or
  /// a color of #ffffff. A value of six would be near white
  /// but not quite.
  const lowDivisor = 6;

  /// if [500] is the default color, there are at LEAST four
  /// steps above [500]. A divisor of 4 would mean [900] is
  /// a lightness of 0.0 or color of #000000
  const highDivisor = 5;

  final lowStep = (1.0 - lightness) / lowDivisor;
  final highStep = lightness / highDivisor;

  return ColorSwatch(color.value, {
    50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
    100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
    200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
    300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
    400: (hslColor.withLightness(lightness + lowStep)).toColor(),
    500: (hslColor.withLightness(lightness)).toColor(),
    600: (hslColor.withLightness(lightness - highStep)).toColor(),
    700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
    800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
    900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
  });
}

const amberScale = ColorSwatch(
  0xffee9d2b,
  <int, Color>{
    1: Color(0xfffefdfb),
    2: Color(0xfffff9ed),
    3: Color(0xfffff4d5),
    4: Color(0xffffecbc),
    5: Color(0xffffe3a2),
    6: Color(0xffffd386),
    7: Color(0xfff3ba63),
    8: Color(0xffee9d2b),
    9: Color(0xffffb224),
    10: Color(0xffffa01c),
    11: Color(0xffad5700),
    12: Color(0xff4e2009)
  },
);

const amberAScale = ColorSwatch(
  0xd4ea8900,
  <int, Color>{
    1: Color(0x04c08205),
    2: Color(0x12ffab02),
    3: Color(0x2affbb01),
    4: Color(0x43ffb700),
    5: Color(0x5dffb300),
    6: Color(0x79ffa201),
    7: Color(0x9cec8d00),
    8: Color(0xd4ea8900),
    9: Color(0xdbffa600),
    10: Color(0xe3ff9500),
    11: Color(0xfaab5300),
    12: Color(0xf6481800)
  },
);

const amberDarkScale = ColorSwatch(
  0xffffb224,
  <int, Color>{
    1: Color(0xff1f1300),
    2: Color(0xff271700),
    3: Color(0xff341c00),
    4: Color(0xff3f2200),
    5: Color(0xff4a2900),
    6: Color(0xff573300),
    7: Color(0xff693f05),
    8: Color(0xff824e00),
    9: Color(0xffffb224),
    10: Color(0xffffcb47),
    11: Color(0xfff1a10d),
    12: Color(0xfffef3dd)
  },
);

const amberDarkAScale = ColorSwatch(
  0xfaffb625,
  <int, Color>{
    1: Color(0x00000000),
    2: Color(0x09fd8300),
    3: Color(0x18fe7300),
    4: Color(0x24ff7b00),
    5: Color(0x31ff8400),
    6: Color(0x40ff9500),
    7: Color(0x54ff970f),
    8: Color(0x71ff9900),
    9: Color(0xfaffb625),
    10: Color(0xfaffce48),
    11: Color(0xefffab0e),
    12: Color(0xfafff8e1)
  },
);

const blueScale = ColorSwatch(
  0xff0091ff,
  <int, Color>{
    1: Color(0xfffbfdff),
    2: Color(0xfff5faff),
    3: Color(0xffedf6ff),
    4: Color(0xffe1f0ff),
    5: Color(0xffcee7fe),
    6: Color(0xffb7d9f8),
    7: Color(0xff96c7f2),
    8: Color(0xff5eb0ef),
    9: Color(0xff0091ff),
    10: Color(0xff0081f1),
    11: Color(0xff006adc),
    12: Color(0xff00254d)
  },
);

Color getTextColor(Color background) {
  const white = Color(0xFFFFFFFF);

  final contrastRatio = _calculateContrast(white, background);

  if (contrastRatio <= 4.5) {
    final hslBackground = HSLColor.fromColor(background);
    final lightness = hslBackground.lightness;
    final saturation = hslBackground.saturation;
    final hue = hslBackground.hue;

    final adjustedLightness = lightness < 0.5 ? 0.95 : 0.05;

    return HSLColor.fromAHSL(
      1.0,
      hue,
      saturation * 0.08,
      adjustedLightness,
    ).toColor();
  }

  return white;
}
