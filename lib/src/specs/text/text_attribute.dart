import 'package:flutter/material.dart';

import '../../attributes/strut_style/strut_style_dto.dart';
import '../../attributes/text_style/text_style_dto.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'text_spec.dart';

class TextSpecAttribute extends SpecAttribute<TextSpecAttribute, TextSpec> {
  final TextOverflow? overflow;
  final StrutStyleDto? strutStyle;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final int? maxLines;
  final TextStyleDto? style;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final TextDirection? textDirection;
  final bool? softWrap;

  const TextSpecAttribute({
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
  });

  @override
  TextSpec resolve(MixData mix) {
    return TextSpec(
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
    );
  }

  @override
  TextSpecAttribute merge(TextSpecAttribute? other) {
    return other == null
        ? this
        : TextSpecAttribute(
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
      ];
}
