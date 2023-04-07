import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../dtos/text_style.dto.dart';
import '../../helpers/extensions.dart';
import 'text_directives/text_directives.dart';

class TextAttributes extends WidgetStyleAttributes {
  final List<TextStyleDto>? _styles;
  final TextStyleDto? _style;

  final StrutStyle? strutStyle;
  final TextAlign? textAlign;

  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;

  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  final List<TextDirective> directives;

  const TextAttributes({
    TextStyleDto? style,
    List<TextStyleDto>? styles,
    this.strutStyle,
    this.textAlign,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.directives = const [],
  })  : _styles = styles,
        _style = style;

  factory TextAttributes.fromValues({
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    List<TextDirective>? directives,
  }) {
    return TextAttributes(
      style: TextStyleDto.maybeFrom(style),
      strutStyle: strutStyle,
      textAlign: textAlign,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      directives: directives ?? const [],
    );
  }

  // Combines the text styles
  List<TextStyleDto>? get styles {
    return [if (_style != null) _style!, ...?_styles];
  }

  @override
  TextAttributes merge(TextAttributes? other) {
    if (other == null) return this;

    return copyWith(
      // Need to inherit to allow for overrides
      styles: other.styles,

      strutStyle: other.strutStyle,
      textAlign: other.textAlign,
      locale: other.locale,
      softWrap: other.softWrap,
      overflow: other.overflow,
      textScaleFactor: other.textScaleFactor,
      maxLines: other.maxLines,

      textWidthBasis: other.textWidthBasis,
      textHeightBehavior: other.textHeightBehavior,
      directives: other.directives,
    );
  }

  @override
  TextAttributes copyWith({
    List<TextStyleDto>? styles,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    List<TextDirective>? directives,
  }) {
    return TextAttributes(
      styles: [...?this.styles, ...?styles],
      strutStyle: this.strutStyle?.merge(strutStyle) ?? strutStyle,
      textAlign: textAlign ?? this.textAlign,
      locale: locale ?? this.locale,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      maxLines: maxLines ?? this.maxLines,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
      directives: [...this.directives, ...?directives],
    );
  }

  @override
  get props => [
        styles,
        strutStyle,
        textAlign,
        locale,
        softWrap,
        overflow,
        textScaleFactor,
        maxLines,
        textWidthBasis,
        textHeightBehavior,
        directives,
      ];
}
