import 'package:flutter/material.dart';

import '../../attributes/strut_style_attribute.dart';
import '../../attributes/text_style_attribute.dart';
import '../../core/directive.dart';
import '../../utils/scalar_util.dart';
import '../../utils/text_style_util.dart';
import 'text_attribute.dart';

final text = TextUtility.selfBuilder;

class TextUtility<T> extends MixUtility<T, TextAttribute> {
  static final selfBuilder = TextUtility((value) => value);

  const TextUtility(super.builder);

  T _overflow(TextOverflow overflow) => call(overflow: overflow);
  T _strutStyle(StrutStyleAttribute strutStyle) => call(strutStyle: strutStyle);
  T _textAlign(TextAlign textAlign) => call(textAlign: textAlign);
  T _textScaleFactor(double textScaleFactor) =>
      call(textScaleFactor: textScaleFactor);
  T _maxLines(int maxLines) => call(maxLines: maxLines);
  T _style(TextStyleAttribute style) => call(style: style);
  T _textWidthBasis(TextWidthBasis textWidthBasis) =>
      call(textWidthBasis: textWidthBasis);
  T _textHeightBehavior(TextHeightBehavior textHeightBehavior) =>
      call(textHeightBehavior: textHeightBehavior);
  T _textDirection(TextDirection textDirection) =>
      call(textDirection: textDirection);
  T _softWrap(bool softWrap) => call(softWrap: softWrap);
  T _directives(List<TextDirective> directives) => call(directives: directives);

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

  T call({
    TextOverflow? overflow,
    StrutStyleAttribute? strutStyle,
    TextAlign? textAlign,
    double? textScaleFactor,
    int? maxLines,
    TextStyleAttribute? style,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    TextDirection? textDirection,
    bool? softWrap,
    List<TextDirective>? directives,
  }) {
    final text = TextAttribute(
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

    return builder(text);
  }
}
