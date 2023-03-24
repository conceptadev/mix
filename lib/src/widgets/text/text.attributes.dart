import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../helpers/dto/double.dto.dart';
import '../../helpers/dto/text_style.dto.dart';
import '../../helpers/extensions.dart';
import 'text_directives/text_directive.attributes.dart';

class TextAttributes extends WidgetAttributes {
  final TextStyleMergeableDto? style;

  final StrutStyle? strutStyle;
  final TextAlign? textAlign;

  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final DoubleDto? textScaleFactor;
  final int? maxLines;

  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  final List<TextDirectiveAttribute> directives;

  const TextAttributes({
    this.style,
    this.strutStyle,
    this.textAlign,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.directives = const [],
  });

  @override
  TextAttributes merge(TextAttributes? other) {
    if (other == null) return this;

    return copyWith(
      // Need to inherit to allow for overrides
      style: other.style,

      strutStyle: other.strutStyle,
      textAlign: other.textAlign,
      locale: other.locale,
      softWrap: other.softWrap,
      overflow: other.overflow,
      textScaleFactor: other.textScaleFactor,
      maxLines: other.maxLines,

      textWidthBasis: other.textWidthBasis,
      textHeightBehavior: other.textHeightBehavior,
      directives: other.directives,
    );
  }

  TextAttributes copyWith({
    TextStyleMergeableDto? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    DoubleDto? textScaleFactor,
    int? maxLines,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    List<TextDirectiveAttribute>? directives,
  }) {
    return TextAttributes(
      style: this.style?.merge(style) ?? style,
      strutStyle: this.strutStyle?.merge(strutStyle) ?? strutStyle,
      textAlign: textAlign ?? this.textAlign,
      locale: locale ?? this.locale,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      maxLines: maxLines ?? this.maxLines,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
      directives: [...this.directives, ...?directives],
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
        other.textWidthBasis == textWidthBasis &&
        other.textHeightBehavior == textHeightBehavior &&
        listEquals(directives, other.directives);
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
        textWidthBasis.hashCode ^
        textHeightBehavior.hashCode ^
        directives.hashCode;
  }
}
