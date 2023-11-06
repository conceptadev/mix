import 'package:flutter/material.dart';

enum ColorSchemeNames {
  primary,
  primaryVariant,
  secondary,
  tertiary,
  secondaryVariant,
  surface,
  background,
  error,
  onPrimary,
  onSecondary,
  onTertiary,
  onSurface,
  onBackground,
  onError,
}

extension ColorSchemeNamesExtension on ColorSchemeNames {
  Color get value {
    return _colorSchemeTranslationValues[index];
  }
}

const _colorSchemeTranslationValues = [
  Color(0xFF000001),
  Color(0xFF000002),
  Color(0xFF000003),
  Color(0xFF000004),
  Color(0xFF000005),
  Color(0xFF000006),
  Color(0xFF000007),
  Color(0xFF000008),
  Color(0xFF000009),
  Color(0xFF00000A),
  Color(0xFF00000B),
  Color(0xFF00000C),
];

/// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".

Color hexToColor(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));

  return Color(int.parse(buffer.toString(), radix: 16));
}
