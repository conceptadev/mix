import 'package:flutter/material.dart';

import '../../attributes/strut_style_attribute.dart';
import '../../core/directive.dart';
import 'text_attribute.dart';

const text = TextUtility();

class TextUtility {
  const TextUtility();

  TextAttribute overflow(TextOverflow overflow) => call(overflow: overflow);
  TextAttribute strutStyle(StrutStyle strutStyle) =>
      call(strutStyle: strutStyle);
  TextAttribute textAlign(TextAlign textAlign) => call(textAlign: textAlign);
  TextAttribute textScaleFactor(double textScaleFactor) =>
      call(textScaleFactor: textScaleFactor);
  TextAttribute maxLines(int maxLines) => call(maxLines: maxLines);
  TextAttribute style(TextStyle style) => call(style: style);
  TextAttribute textWidthBasis(TextWidthBasis textWidthBasis) =>
      call(textWidthBasis: textWidthBasis);
  TextAttribute textHeightBehavior(TextHeightBehavior textHeightBehavior) =>
      call(textHeightBehavior: textHeightBehavior);
  TextAttribute textDirection(TextDirection textDirection) =>
      call(textDirection: textDirection);
  TextAttribute softWrap(bool softWrap) => call(softWrap: softWrap);
  TextAttribute directives(List<TextDirective> directives) =>
      call(directives: directives);

  TextAttribute call({
    TextOverflow? overflow,
    StrutStyleAttribute? strutStyle,
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
    return TextAttribute(
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
  }
}
