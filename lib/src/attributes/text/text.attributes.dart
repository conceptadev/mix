import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
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
  final TextHeightBehavior? textHeightBehavior;

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
    this.textHeightBehavior,
  });

  TextAttributes applyContext(BuildContext context) {
    return copyWith(
      style: context.defaultTextStyle().merge(style),
    );
  }

  TextAttributes merge(TextAttributes? other) {
    if (other == null) return this;

    return copyWith(
      // Need to inherit to allow for overrides
      style: style?.merge(other.style) ?? other.style,
      strutStyle: strutStyle?.merge(other.strutStyle) ?? other.strutStyle,
      textAlign: other.textAlign,
      locale: other.locale,
      softWrap: other.softWrap,
      overflow: other.overflow,
      textScaleFactor: other.textScaleFactor,
      maxLines: other.maxLines,
      semanticsLabel: other.semanticsLabel,
      textWidthBasis: other.textWidthBasis,
      textHeightBehavior: other.textHeightBehavior,
    );
  }

  TextAttributes copyWith({
    TextStyle? style,
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
    return TextAttributes(
      style: style ?? this.style,
      strutStyle: strutStyle ?? this.strutStyle,
      textAlign: textAlign ?? this.textAlign,
      locale: locale ?? this.locale,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      maxLines: maxLines ?? this.maxLines,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextAttributes &&
        other.style == style &&
        other.strutStyle == strutStyle &&
        other.textAlign == textAlign &&
        other.locale == locale &&
        other.softWrap == softWrap &&
        other.overflow == overflow &&
        other.textScaleFactor == textScaleFactor &&
        other.maxLines == maxLines &&
        other.semanticsLabel == semanticsLabel &&
        other.textWidthBasis == textWidthBasis &&
        other.textHeightBehavior == textHeightBehavior;
  }

  @override
  int get hashCode {
    return style.hashCode ^
        strutStyle.hashCode ^
        textAlign.hashCode ^
        locale.hashCode ^
        softWrap.hashCode ^
        overflow.hashCode ^
        textScaleFactor.hashCode ^
        maxLines.hashCode ^
        semanticsLabel.hashCode ^
        textWidthBasis.hashCode ^
        textHeightBehavior.hashCode;
  }
}
