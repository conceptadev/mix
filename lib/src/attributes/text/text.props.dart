import 'dart:ui';

import 'package:flutter/material.dart';

class TextProps {
  final bool softWrap;
  final TextOverflow overflow;
  final TextStyle style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  // Constructor
  const TextProps({
    required this.softWrap,
    required this.overflow,
    required this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
  });
}
