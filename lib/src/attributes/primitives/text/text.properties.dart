import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mix/src/attributes/primitives/text/text_attributes.dart';
import 'package:mix/src/helpers/extensions.dart';

import '../../base_attribute.dart';

class TextProperties extends Properties<TextAttributes> {
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  const TextProperties({
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
  });

  TextProperties merge(TextProperties other) {
    return TextProperties(
      style: style?.merge(style) ?? other.style,
      strutStyle: strutStyle?.merge(strutStyle) ?? other.strutStyle,
      textAlign: other.textAlign ?? textAlign,
      textDirection: other.textDirection ?? textDirection,
      locale: other.locale ?? locale,
      softWrap: other.softWrap ?? softWrap,
      overflow: other.overflow ?? overflow,
      textScaleFactor: other.textScaleFactor ?? textScaleFactor,
      maxLines: other.maxLines ?? maxLines,
      semanticsLabel: other.semanticsLabel ?? semanticsLabel,
      textWidthBasis: other.textWidthBasis ?? textWidthBasis,
    );
  }

  @override
  TextAttributes build() {
    return TextAttributes(
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap ?? true,
      overflow: overflow ?? TextOverflow.clip,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
    );
  }
}
