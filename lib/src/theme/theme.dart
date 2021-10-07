import 'package:flutter/material.dart';

MixTheme mixTheme = MixTheme();

class MixTheme {
  final Brightness brightness;
  final Color primaryColor;

  const MixTheme.raw({
    required this.brightness,
    required this.primaryColor,
  });

  factory MixTheme({
    Brightness? brightness,
    Color? primaryColor,
  }) {
    brightness ??=
        WidgetsBinding.instance!.platformDispatcher.platformBrightness;
    primaryColor ??= Colors.blue;
    return MixTheme.raw(
      brightness: brightness,
      primaryColor: primaryColor,
    );
  }

  MixTheme copyWith({
    Brightness? brightness,
    Color? primaryColor,
  }) {
    return MixTheme(
      brightness: brightness ?? this.brightness,
      primaryColor: primaryColor ?? this.primaryColor,
    );
  }
}
