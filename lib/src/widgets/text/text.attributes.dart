import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../dtos/text_style_attribute.dart';
import '../../extensions/helper_ext.dart';
import 'text_directives/text_directives.dart';

@Deprecated('Use TextStyleAttributes instead')
typedef TextAttributes = StyledTextAttributes;

class StyledTextAttributes extends StyledWidgetAttributes {
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

  final List<TextStyleAttribute>? _styles;
  final TextStyleAttribute? _style;

  const StyledTextAttributes({
    this.directives = const [],
    this.locale,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.strutStyle,
    TextStyleAttribute? style,
    List<TextStyleAttribute>? styles,
    this.textAlign,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  })  : _styles = styles,
        _style = style;

  factory StyledTextAttributes.fromValues({
    List<TextDirective>? directives,
    Locale? locale,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    StrutStyle? strutStyle,
    TextStyle? style,
    TextAlign? textAlign,
    TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) {
    return StyledTextAttributes(
      directives: directives ?? const [],
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      strutStyle: strutStyle,
      style: TextStyleAttribute.maybeFrom(style),
      textAlign: textAlign,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  // Combines the text styles.
  List<TextStyleAttribute> get styles {
    return [if (_style != null) _style!, ...?_styles];
  }

  @override
  StyledTextAttributes merge(StyledTextAttributes? other) {
    if (other == null) return this;

    return copyWith(
      directives: other.directives,
      locale: other.locale,
      maxLines: other.maxLines,

      overflow: other.overflow,
      softWrap: other.softWrap,
      strutStyle: other.strutStyle,
      // Need to inherit to allow for overrides.
      styles: other.styles,

      textAlign: other.textAlign,
      textHeightBehavior: other.textHeightBehavior,
      textScaleFactor: other.textScaleFactor,
      textWidthBasis: other.textWidthBasis,
    );
  }

  @override
  StyledTextAttributes copyWith({
    List<TextDirective>? directives,
    Locale? locale,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    StrutStyle? strutStyle,
    List<TextStyleAttribute>? styles,
    TextAlign? textAlign,
    TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
  }) {
    return StyledTextAttributes(
      directives: [...this.directives, ...?directives],
      locale: locale ?? this.locale,
      maxLines: maxLines ?? this.maxLines,
      overflow: overflow ?? this.overflow,
      softWrap: softWrap ?? this.softWrap,
      strutStyle: this.strutStyle?.merge(strutStyle) ?? strutStyle,
      styles: [...this.styles, ...?styles],
      textAlign: textAlign ?? this.textAlign,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
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
