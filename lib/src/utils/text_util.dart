// ignore_for_file: long-parameter-list

import 'package:flutter/material.dart';

import '../attributes/visual_attributes.dart';
import '../core/directives/text_directive.dart';
import '../core/dto/strut_style_dto.dart';
import '../helpers/extensions/values_ext.dart';

StrutStyleDto strutStyle(StrutStyle strutStyle) {
  return strutStyle.toAttribute;
}

TextDirectiveAttribute textDirective(TextDirective directive) {
  return TextDirectiveAttribute([directive]);
}

SoftWrapAttribute softWrap(bool softWrap) {
  return SoftWrapAttribute(softWrap);
}

TextOverflowAttribute textOverflow(TextOverflow overflow) {
  return TextOverflowAttribute(overflow);
}

TextScaleFactorAttribute textScaleFactor(double textScaleFactor) {
  return TextScaleFactorAttribute(textScaleFactor);
}

MaxLinesAttribute maxLines(int maxLines) {
  return MaxLinesAttribute(maxLines);
}

TextWidthBasisAttribute textWidthBasis(TextWidthBasis textWidthBasis) {
  return TextWidthBasisAttribute(textWidthBasis);
}

TextAlignAttribute textAlign(TextAlign textAlign) {
  return TextAlignAttribute(textAlign);
}

@Deprecated('Use textDirective(directive)')
TextDirectiveAttribute directives(List<TextDirective> directives) {
  return TextDirectiveAttribute(directives);
}

@Deprecated('Use textDirective(directive)')
TextDirectiveAttribute directive(TextDirective directive) {
  return TextDirectiveAttribute([directive]);
}

@Deprecated('Locale is now passed to StyledText widget')
TextStyleAttribute locale() {
  throw UnimplementedError();
}

@Deprecated('Use text(overflow: overflow)')
TextOverflowAttribute overflow(TextOverflow overflow) {
  return TextOverflowAttribute(overflow);
}
