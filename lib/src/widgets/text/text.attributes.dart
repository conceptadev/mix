import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../helpers/extensions.dart';
import '../../theme/refs/text_style_token.dart';

/// ## Widget:
/// - [TextMix](TextMix-class.html)
/// {@category Attributes}
class TextAttributes extends InheritedAttribute {
  final TextStyle? style;
  // Ref for context
  final TextStyleToken? styleRef;
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

  @override
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
    TextStyleToken? styleRef,
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
    TextStyle? thisStyle = this.style;
    TextStyle? otherStyle = style;

    TextStyleToken? thisStyleRef = this.styleRef;
    TextStyleToken? otherStyleRef = styleRef;

    // During the merge we need to move the ref
    // clunky but allows cleaner api for devs
    if (thisStyle is TextStyleToken) {
      thisStyleRef = thisStyle;
    } else {
      thisStyle = thisStyle;
    }

    if (style is TextStyleToken) {
      otherStyleRef = style;
    } else {
      otherStyle = style;
    }

    return TextAttributes(
      style: thisStyle?.merge(otherStyle) ?? otherStyle,
      strutStyle: this.strutStyle?.merge(strutStyle) ?? strutStyle,
      styleRef: otherStyleRef ?? thisStyleRef,
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
