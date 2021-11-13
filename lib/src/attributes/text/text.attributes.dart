import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mix/src/helpers/extensions.dart';

import '../common/attribute.dart';

class TextAttributes extends Attribute {
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;

  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  const TextAttributes({
    this.style,
    this.strutStyle,
    this.textAlign,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
  });

  TextAttributes merge(TextAttributes other) {
    final merge = style?.merge(other.style) ?? other.style;
    return TextAttributes(
      style: merge,
      strutStyle: strutStyle?.merge(other.strutStyle) ?? other.strutStyle,
      textAlign: other.textAlign ?? textAlign,
      locale: other.locale ?? locale,
      softWrap: other.softWrap ?? softWrap,
      overflow: other.overflow ?? overflow,
      textScaleFactor: other.textScaleFactor ?? textScaleFactor,
      maxLines: other.maxLines ?? maxLines,
      semanticsLabel: other.semanticsLabel ?? semanticsLabel,
      textWidthBasis: other.textWidthBasis ?? textWidthBasis,
    );
  }
}
