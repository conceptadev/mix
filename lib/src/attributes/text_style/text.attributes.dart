import 'package:flutter/material.dart';

import '../../attributes/resolvable_attribute.dart';
import '../../attributes/text_style/text_style_attribute.dart';
import '../../factory/exports.dart';
import '../../widgets/text/text_directives/text_directives.dart';
import 'text.dto.dart';

class TextAttributes extends ResolvableAttribute<TextDto> {
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;

  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;

  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  final List<TextDirective> directives;

  final TextStyleAttribute? _style;

  const TextAttributes({
    this.directives = const [],
    this.locale,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.strutStyle,
    TextStyleAttribute? style,
    this.textAlign,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : _style = style;

  factory TextAttributes.fromValues({
    List<TextDirective>? directives,
    Locale? locale,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    StrutStyle? strutStyle,
    TextStyle? style,
    TextAlign? textAlign,
    TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) {
    return TextAttributes(
      directives: directives ?? const [],
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      strutStyle: strutStyle,
      style: style == null ? null : TextStyleAttribute.from(style),
      textAlign: textAlign,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  // Combines the text styles.

  @override
  TextAttributes merge(TextAttributes? other) {
    if (other == null) return this;

    return TextAttributes(
      directives: other.directives,
      locale: other.locale,
      maxLines: other.maxLines,

      overflow: other.overflow,
      softWrap: other.softWrap,
      strutStyle: other.strutStyle,
      // Need to inherit to allow for overrides.
      style: _style?.merge(other._style) ?? other._style,
      textAlign: other.textAlign,
      textHeightBehavior: other.textHeightBehavior,
      textScaleFactor: other.textScaleFactor,
      textWidthBasis: other.textWidthBasis,
    );
  }

  @override
  TextDto resolve(MixData mix) {
    return TextDto(
      softWrap: softWrap ?? true,
      overflow: overflow ?? TextOverflow.clip,
      strutStyle: strutStyle,
      textAlign: textAlign,
      locale: locale,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      style: _style?.resolve(mix),
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      directives: directives,
    );
  }

  @override
  get props => [
        _style,
        strutStyle,
        textAlign,
        locale,
        softWrap,
        overflow,
        textScaleFactor,
        maxLines,
        textWidthBasis,
        textHeightBehavior,
        directives,
      ];
}
