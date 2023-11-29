import 'package:flutter/material.dart';

import '../../attributes/strut_style_attribute.dart';
import '../../attributes/text_style/text_style_attribute.dart';
import '../../core/attribute.dart';
import '../../core/directive.dart';
import '../../factory/mix_provider_data.dart';
import 'text_mixture.dart';

class TextMixAttribute
    extends ResolvableAttribute<TextMixAttribute, TextMixture> {
  final TextOverflow? overflow;
  final StrutStyleAttribute? strutStyle;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final int? maxLines;
  final TextStyleAttribute? style;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final TextDirection? textDirection;
  final bool? softWrap;
  final List<TextDirective>? directives;

  const TextMixAttribute({
    this.overflow,
    this.strutStyle,
    this.textAlign,
    this.textScaleFactor,
    this.maxLines,
    this.style,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.textDirection,
    this.softWrap,
    this.directives,
  });

  static TextMixAttribute of(MixData mix) {
    final attribute = mix.attributeOf<TextMixAttribute>();

    return TextMixAttribute(
      strutStyle: mix.attributeOf<StrutStyleAttribute>(),
      style: mix.attributeOf<TextStyleAttribute>(),
    ).merge(attribute);
  }

  @override
  TextMixture resolve(MixData mix) {
    return TextMixture(
      overflow: overflow,
      strutStyle: strutStyle?.resolve(mix),
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      style: style?.resolve(mix),
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      textDirection: textDirection,
      softWrap: softWrap,
      directives: directives ?? [],
    );
  }

  @override
  TextMixAttribute merge(covariant TextMixAttribute? other) {
    if (other == null) return this;

    return TextMixAttribute(
      overflow: other.overflow ?? overflow,
      strutStyle: strutStyle?.merge(other.strutStyle) ?? other.strutStyle,
      textAlign: other.textAlign ?? textAlign,
      textScaleFactor: other.textScaleFactor ?? textScaleFactor,
      maxLines: other.maxLines ?? maxLines,
      style: style?.merge(other.style) ?? other.style,
      textWidthBasis: other.textWidthBasis ?? textWidthBasis,
      textHeightBehavior: other.textHeightBehavior ?? textHeightBehavior,
      textDirection: other.textDirection ?? textDirection,
      softWrap: other.softWrap ?? softWrap,
      directives: [...(directives ?? []), ...(other.directives ?? [])],
    );
  }

  @override
  List<Object?> get props => [
        overflow,
        strutStyle,
        textAlign,
        textScaleFactor,
        maxLines,
        style,
        textWidthBasis,
        textHeightBehavior,
        textDirection,
        softWrap,
        directives,
      ];
}
