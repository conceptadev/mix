import 'package:flutter/material.dart';

import '../../attributes/exports.dart';
import 'text_directives/text_directives.dart';

class TextDto extends Dto {
  final bool softWrap;
  final TextOverflow overflow;

  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final Locale? locale;
  final double? textScaleFactor;
  final int? maxLines;

  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final List<TextDirective> _directives;

  const TextDto({
    required this.softWrap,
    required this.overflow,
    this.strutStyle,
    this.textAlign,
    this.locale,
    this.textScaleFactor,
    this.maxLines,
    this.textWidthBasis,
    this.textHeightBehavior,
    List<TextDirective>? directives,
  }) : _directives = directives ?? const [];

  String applyTextDirectives(String? text) {
    if (text == null) return '';

    String modifiedText = text;
    for (final directive in _directives) {
      modifiedText = directive.modify(modifiedText);
    }

    return modifiedText;
  }

  @override
  TextDto merge(TextDto? other) {
    if (other == null) return this;

    return TextDto(
      softWrap: other.softWrap,
      overflow: other.overflow,
      strutStyle: other.strutStyle ?? strutStyle,
      textAlign: other.textAlign ?? textAlign,
      locale: other.locale ?? locale,
      textScaleFactor: other.textScaleFactor ?? textScaleFactor,
      maxLines: other.maxLines ?? maxLines,
      textWidthBasis: other.textWidthBasis ?? textWidthBasis,
      textHeightBehavior: other.textHeightBehavior ?? textHeightBehavior,
      directives: [..._directives, ...other._directives],
    );
  }

  @override
  get props => [
        softWrap,
        overflow,
        strutStyle,
        textAlign,
        locale,
        textScaleFactor,
        maxLines,
        textWidthBasis,
        textHeightBehavior,
        _directives,
      ];
}
