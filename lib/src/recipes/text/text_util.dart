import 'package:flutter/material.dart';

import '../../attributes/strut_style_attribute.dart';
import '../../attributes/text_direction_attribute.dart';
import '../../attributes/text_style/text_style_attribute.dart';
import '../../core/directive.dart';
import '../../core/extensions/values_ext.dart';
import '../../utils/scalar_util.dart';
import '../../utils/shadow_util.dart';
import '../../utils/text_style_util.dart';
import 'text_attribute.dart';

const text = TextUtility.selfBuilder;
const textStyle = TextStyleUtility.selfBuilder;
const shadow = ShadowUtility.selfBuilder;

class TextUtility<T> extends MixUtility<T, TextMixAttribute> {
  static const selfBuilder = TextUtility(MixUtility.selfBuilder);

  const TextUtility(super.builder);

  T _overflow(TextOverflow overflow) => only(overflow: overflow);
  T _strutStyle(StrutStyleAttribute strutStyle) => only(strutStyle: strutStyle);
  T _textAlign(TextAlign textAlign) => only(textAlign: textAlign);
  T _textScaleFactor(double textScaleFactor) =>
      only(textScaleFactor: textScaleFactor);
  T _maxLines(int maxLines) => only(maxLines: maxLines);
  T _style(TextStyleAttribute style) => only(style: style);
  T _textWidthBasis(TextWidthBasis textWidthBasis) =>
      only(textWidthBasis: textWidthBasis);
  T _textHeightBehavior(TextHeightBehavior textHeightBehavior) =>
      only(textHeightBehavior: textHeightBehavior);
  T _textDirection(TextDirection textDirection) =>
      call(textDirection: textDirection);
  T _softWrap(bool softWrap) => call(softWrap: softWrap);
  T _directives(List<TextDirective> directives) => only(directives: directives);

  TextOverflowUtility<T> get overflow => TextOverflowUtility(_overflow);
  StrutStyleUtility<T> get strutStyle => StrutStyleUtility(_strutStyle);
  TextAlignUtility<T> get textAlign => TextAlignUtility(_textAlign);
  DoubleUtility<T> get textScaleFactor => DoubleUtility(_textScaleFactor);
  IntUtility<T> get maxLines => IntUtility(_maxLines);
  TextStyleUtility<T> get style => TextStyleUtility(_style);
  TextWidthBasisUtility<T> get textWidthBasis =>
      TextWidthBasisUtility(_textWidthBasis);
  TextHeightBehaviorUtility<T> get textHeightBehavior =>
      TextHeightBehaviorUtility(_textHeightBehavior);
  TextDirectionUtility<T> get textDirection =>
      TextDirectionUtility(_textDirection);
  BoolUtility<T> get softWrap => BoolUtility(_softWrap);
  ListUtility<T, TextDirective> get directives => ListUtility(_directives);

  T only({
    TextOverflow? overflow,
    StrutStyleAttribute? strutStyle,
    TextAlign? textAlign,
    double? textScaleFactor,
    int? maxLines,
    TextStyleAttribute? style,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    TextDirectionAttribute? textDirection,
    bool? softWrap,
    List<TextDirective>? directives,
  }) {
    final text = TextMixAttribute(
      overflow: overflow,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      style: style,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      textDirection: textDirection,
      softWrap: softWrap,
      directives: directives,
    );

    return as(text);
  }

  T call({
    TextOverflow? overflow,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    double? textScaleFactor,
    int? maxLines,
    TextStyle? style,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    TextDirection? textDirection,
    bool? softWrap,
    List<TextDirective>? directives,
  }) {
    final text = TextMixAttribute(
      overflow: overflow,
      strutStyle: strutStyle?.toAttribute(),
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      style: style?.toAttribute(),
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      textDirection: textDirection?.toAttribute(),
      softWrap: softWrap,
      directives: directives,
    );

    return as(text);
  }
}
