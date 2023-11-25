import 'package:flutter/material.dart';

import '../../attributes/strut_style_attribute.dart';
import '../../attributes/text_direction_attribute.dart';
import '../../attributes/text_style/text_style_attribute.dart';
import '../../core/attribute.dart';
import '../../core/directive.dart';
import '../../factory/mix_provider_data.dart';
import 'text_mixture.dart';

class TextMixtureAttribute extends ResolvableAttribute<TextMixture> {
  final TextOverflow? overflow;
  final StrutStyleAttribute? strutStyle;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final int? maxLines;
  final TextStyleAttribute? style;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final TextDirectionAttribute? textDirection;
  final bool? softWrap;
  final List<TextDirective>? directives;

  const TextMixtureAttribute({
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
      textDirection: textDirection?.value,
      softWrap: softWrap,
      directives: directives ?? [],
    );
  }

  @override
  TextMixtureAttribute merge(covariant TextMixtureAttribute? other) {
    if (other == null) return this;

    return TextMixtureAttribute(
      overflow: overflow ?? other.overflow,
      strutStyle: strutStyle ?? other.strutStyle,
      textAlign: textAlign ?? other.textAlign,
      textScaleFactor: textScaleFactor ?? other.textScaleFactor,
      maxLines: maxLines ?? other.maxLines,
      style: style ?? other.style,
      textWidthBasis: textWidthBasis ?? other.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? other.textHeightBehavior,
      textDirection: textDirection ?? other.textDirection,
      softWrap: softWrap ?? other.softWrap,
      directives: directives ?? other.directives,
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
