import 'package:flutter/material.dart';

import '../../attributes/strut_style_attribute.dart';
import '../../attributes/text_style_attribute.dart';
import '../../core/attribute.dart';
import '../../core/directive.dart';
import '../../factory/mix_provider_data.dart';
import 'text_recipe.dart';

class TextAttribute extends ResolvableAttribute<TextRecipe> {
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

  const TextAttribute({
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
  TextRecipe resolve(MixData mix) {
    return TextRecipe(
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
  TextAttribute merge(covariant TextAttribute? other) {
    if (other == null) return this;

    return TextAttribute(
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
