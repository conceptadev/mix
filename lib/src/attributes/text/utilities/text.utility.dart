// ignore_for_file: long-parameter-list

import 'package:flutter/material.dart';

import '../attributes/text.attribute.dart';
import '../attributes/text_style.attribute.dart';
import '../directives/text.directive.dart';

TextAttributes text({
  List<TextDirective>? directives,
  TextDirective? directive,
  Locale? locale,
  int? maxLines,
  TextOverflow? overflow,
  bool? softWrap,
  StrutStyle? strutStyle,
  TextStyleAttribute? style,
  TextAlign? textAlign,
  TextHeightBehavior? textHeightBehavior,
  double? textScaleFactor,
  TextWidthBasis? textWidthBasis,
}) {
  final textDirectives = directives ?? [];

  if (directive != null) textDirectives.add(directive);

  return TextAttributes(
    directives: textDirectives,
    locale: locale,
    maxLines: maxLines,
    overflow: overflow,
    softWrap: softWrap,
    strutStyle: strutStyle,
    style: style,
    textAlign: textAlign,
    textHeightBehavior: textHeightBehavior,
    textScaleFactor: textScaleFactor,
    textWidthBasis: textWidthBasis,
  );
}

@Deprecated('Use text(strutStyle: strutStyle)')
TextAttributes strutStyle(StrutStyle strutStyle) {
  return TextAttributes(strutStyle: strutStyle);
}

@Deprecated('Use text(textAlign: textAlign)')
TextAttributes textAlign(TextAlign textAlign) {
  return TextAttributes(textAlign: textAlign);
}

@Deprecated('Use text(locale: locale)')
TextAttributes locale(Locale locale) {
  return TextAttributes(locale: locale);
}

@Deprecated('Use text(softWrap: softWrap)')
TextAttributes softWrap(bool softWrap) {
  return TextAttributes(softWrap: softWrap);
}

@Deprecated('Use text(overflow: overflow)')
TextAttributes overflow(TextOverflow overflow) {
  return TextAttributes(overflow: overflow);
}

@Deprecated('Use text(textScaleFactor: textScaleFactor)')
TextAttributes textScaleFactor(double textScaleFactor) {
  return TextAttributes(textScaleFactor: textScaleFactor);
}

@Deprecated('Use text(maxLines: maxLines)')
TextAttributes maxLines(int maxLines) {
  return TextAttributes(maxLines: maxLines);
}

@Deprecated('Use text(textWidthBasis: textWidthBasis)')
TextAttributes textWidthBasis(TextWidthBasis textWidthBasis) {
  return TextAttributes(textWidthBasis: textWidthBasis);
}

@Deprecated('Use text(directives: directives)')
TextAttributes directives(List<TextDirective> directives) {
  return TextAttributes(directives: directives);
}

@Deprecated('Use text(directives: directives)')
TextAttributes directive(TextDirective directive) {
  return TextAttributes(directives: [directive]);
}
