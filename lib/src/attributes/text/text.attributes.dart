import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/helpers/extensions.dart';
import 'package:mix/src/theme/refs/refs.dart';

import '../common/attribute.dart';

class TextAttributes extends Attribute {
  final TextStyle? style;
  // Ref for context
  final TextStyleRef? styleRef;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;

  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;

  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  const TextAttributes({
    this.style,
    this.styleRef,
    this.strutStyle,
    this.textAlign,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.textWidthBasis,
    this.textHeightBehavior,
  });

  TextAttributes merge(TextAttributes? other) {
    if (other == null) return this;

    return copyWith(
      // Need to inherit to allow for overrides
      style: other.style,
      styleRef: other.styleRef,
      strutStyle: other.strutStyle,
      textAlign: other.textAlign,
      locale: other.locale,
      softWrap: other.softWrap,
      overflow: other.overflow,
      textScaleFactor: other.textScaleFactor,
      maxLines: other.maxLines,

      textWidthBasis: other.textWidthBasis,
      textHeightBehavior: other.textHeightBehavior,
    );
  }

  TextAttributes copyWith({
    TextStyle? style,
    TextStyleRef? styleRef,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
  }) {
    TextStyle? _thisStyle = this.style;
    TextStyle? _otherStyle = style;

    TextStyleRef? _thisStyleRef = this.styleRef;
    TextStyleRef? _otherStyleRef = styleRef;

    // During the merge we need to move the ref
    // clunky but allows cleaner api for devs
    if (_thisStyle is TextStyleRef) {
      _thisStyleRef = _thisStyle;
    } else {
      _thisStyle = _thisStyle;
    }

    if (style is TextStyleRef) {
      _otherStyleRef = style;
    } else {
      _otherStyle = style;
    }

    return TextAttributes(
      style: _thisStyle?.merge(_otherStyle) ?? _otherStyle,
      strutStyle: this.strutStyle?.merge(strutStyle) ?? strutStyle,
      styleRef: _otherStyleRef ?? _thisStyleRef,
      textAlign: textAlign ?? this.textAlign,
      locale: locale ?? this.locale,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      maxLines: maxLines ?? this.maxLines,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextAttributes &&
        other.style == style &&
        other.styleRef == styleRef &&
        other.strutStyle == strutStyle &&
        other.textAlign == textAlign &&
        other.locale == locale &&
        other.softWrap == softWrap &&
        other.overflow == overflow &&
        other.textScaleFactor == textScaleFactor &&
        other.maxLines == maxLines &&
        other.textWidthBasis == textWidthBasis &&
        other.textHeightBehavior == textHeightBehavior;
  }

  @override
  int get hashCode {
    return style.hashCode ^
        styleRef.hashCode ^
        strutStyle.hashCode ^
        textAlign.hashCode ^
        locale.hashCode ^
        softWrap.hashCode ^
        overflow.hashCode ^
        textScaleFactor.hashCode ^
        maxLines.hashCode ^
        textWidthBasis.hashCode ^
        textHeightBehavior.hashCode;
  }
}
