// ignore_for_file: long-parameter-list

import 'package:flutter/material.dart';

import '../../strut_style.attribute.dart';
import '../../text.attribute.dart';
import '../directives/text.directive.dart';

const text = TextAttributes.from;

@Deprecated('Use text(strutStyle: strutStyle)')
TextAttributes strutStyle(StrutStyle strutStyle) {
  return TextAttributes(strutStyle: StrutStyleAttribute.from(strutStyle));
}

@Deprecated('Use text(textAlign: textAlign)')
TextAttributes textAlign(TextAlign textAlign) {
  return TextAttributes.from(textAlign: textAlign);
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
  return TextAttributes.from(overflow: overflow);
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
