import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../attributes/color/color_dto.dart';

extension ColorExt on Color {
  Color mix(Color toColor, [int amount = 50]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;

    return Color.fromARGB(
      ((toColor.alpha - alpha) * p + alpha).round(),
      ((toColor.red - red) * p + red).round(),
      ((toColor.green - green) * p + green).round(),
      ((toColor.blue - blue) * p + blue).round(),
    );
  }

  Color lighten([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final hsl = HSLColor.fromColor(this);
    final lightness = _clamp(hsl.lightness + p);

    return hsl.withLightness(lightness).toColor();
  }

  Color brighten([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;

    return Color.fromARGB(
      alpha,
      math.max(0, math.min(255, red - (255 * -p).round())),
      math.max(0, math.min(255, green - (255 * -p).round())),
      math.max(0, math.min(255, blue - (255 * -p).round())),
    );
  }

  Color contrast([int amount = 100]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;

    final luminance = computeLuminance();

    return luminance > 0.5 ? darken((p).round()) : brighten((p).round());
  }

  Color darken([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final hsl = HSLColor.fromColor(this);
    final lightness = _clamp(hsl.lightness - p);

    return hsl.withLightness(lightness).toColor();
  }

  Color tint([int amount = 10]) => mix(
        const Color.fromRGBO(255, 255, 255, 1.0),
        amount,
      );

  Color shade([int amount = 10]) => mix(
        const Color.fromRGBO(0, 0, 0, 1.0),
        amount,
      );

  Color desaturate([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final hsl = HSLColor.fromColor(this);
    final saturation = _clamp(hsl.saturation - p);

    return hsl.withSaturation(saturation).toColor();
  }

  Color saturate([int amount = 10]) {
    final p = RangeError.checkValueInInterval(amount, 0, 100, 'amount') / 100;
    final hsl = HSLColor.fromColor(this);
    final saturation = _clamp(hsl.saturation + p);

    return hsl.withSaturation(saturation).toColor();
  }

  Color greyscale() => desaturate(100);

  Color complement() {
    final hsl = HSLColor.fromColor(this);
    final hue = (hsl.hue + 180) % 360;

    return hsl.withHue(hue).toColor();
  }

  ColorDto toDto() => ColorDto(this);
}

double _clamp(double val) => math.min(1.0, math.max(0.0, val));
