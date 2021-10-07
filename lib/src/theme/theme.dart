import 'package:flutter/material.dart';

MixTheme mixTheme = MixTheme();

class MixTheme {
  final Brightness brightness;
  final ColorSwatch primaryColor;
  final Color disabledColor;

  const MixTheme.raw({
    required this.brightness,
    required this.primaryColor,
    required this.disabledColor,
  });

  factory MixTheme({
    Brightness? brightness,
    ColorSwatch? primaryColor,
    Color? disabledColor,
  }) {
    brightness ??=
        WidgetsBinding.instance!.platformDispatcher.platformBrightness;
    primaryColor ??= Colors.blue;
    disabledColor ??= Colors.grey.shade300;
    return MixTheme.raw(
      brightness: brightness,
      primaryColor: primaryColor,
      disabledColor: disabledColor,
    );
  }

  MixTheme copyWith({
    Brightness? brightness,
    ColorSwatch? primaryColor,
    Color? disabledColor,
  }) {
    return MixTheme(
      brightness: brightness ?? this.brightness,
      primaryColor: primaryColor ?? this.primaryColor,
      disabledColor: disabledColor ?? this.disabledColor,
    );
  }
}
