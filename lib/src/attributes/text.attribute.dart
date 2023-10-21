import 'package:flutter/material.dart';

import '../factory/exports.dart';
import 'strut_style.attribute.dart';
import 'style_attribute.dart';
import 'text/directives/text.directive.dart';
import 'text_align.attribute.dart';
import 'text_direction.attribute.dart';
import 'text_overflow.attribute.dart';
import 'text_style.attribute.dart';

class TextAttributes extends StyleAttribute<TextSpec> {
  final List<TextDirective> _directives;
  final TextHeightBehavior? _textHeightBehavior;
  final int? _maxLines;
  final TextWidthBasis? _textWidthBasis;
  final double? _textScaleFactor;
  final TextOverflowAttribute? _overflow;
  final TextAlignAttribute? _textAlign;
  final bool? _softWrap;
  final Locale? _locale;
  final StrutStyleAttribute? _strutStyle;
  final List<TextStyleAttribute>? _styles;
  final TextDirectionAttribute? _textDirection;

  const TextAttributes({
    List<TextDirective> directives = const [],
    Locale? locale,
    int? maxLines,
    TextOverflowAttribute? overflow,
    bool? softWrap,
    StrutStyleAttribute? strutStyle,
    List<TextStyleAttribute>? styles,
    TextAlignAttribute? textAlign,
    TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextDirectionAttribute? textDirection,
    TextWidthBasis? textWidthBasis,
  })  : _maxLines = maxLines,
        _directives = directives,
        _textHeightBehavior = textHeightBehavior,
        _textWidthBasis = textWidthBasis,
        _textScaleFactor = textScaleFactor,
        _overflow = overflow,
        _textAlign = textAlign,
        _softWrap = softWrap,
        _locale = locale,
        _textDirection = textDirection,
        _strutStyle = strutStyle,
        _styles = styles;

  factory TextAttributes.from({
    List<TextDirective>? directives,
    Locale? locale,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
    TextWidthBasis? textWidthBasis,
    List<TextStyle>? styles,
    TextDirection? textDirection,
  }) {
    return TextAttributes(
      directives: directives ?? const [],
      locale: locale,
      maxLines: maxLines,
      overflow: TextOverflowAttribute.maybeFrom(overflow),
      softWrap: softWrap,
      strutStyle: StrutStyleAttribute.maybeFrom(strutStyle),
      styles: styles?.map(TextStyleAttribute.from).toList(),
      textAlign: TextAlignAttribute.maybeFrom(textAlign),
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textDirection: TextDirectionAttribute.maybeFrom(textDirection),
      textWidthBasis: textWidthBasis,
    );
  }

  // Combines the text styles.

  @override
  TextAttributes merge(TextAttributes? other) {
    if (other == null) return this;

    return TextAttributes(
      directives: other._directives + _directives,
      locale: other._locale ?? _locale,
      maxLines: other._maxLines ?? _maxLines,

      overflow: other._overflow ?? _overflow,
      softWrap: other._softWrap ?? _softWrap,
      strutStyle: other._strutStyle ?? _strutStyle,
      // Need to inherit to allow for overrides.
      styles: mergeAttrList(_styles, other._styles),
      textAlign: other._textAlign ?? _textAlign,
      textHeightBehavior: other._textHeightBehavior ?? _textHeightBehavior,
      textScaleFactor: other._textScaleFactor ?? _textScaleFactor,
      textDirection: other._textDirection ?? _textDirection,
      textWidthBasis: other._textWidthBasis ?? _textWidthBasis,
    );
  }

  @override
  TextSpec resolve(MixData mix) {
    return TextSpec(
      softWrap: _softWrap ?? true,
      overflow: resolveAttr(_overflow, mix),
      strutStyle: resolveAttr(_strutStyle, mix),
      textAlign: resolveAttr(_textAlign, mix),
      locale: _locale,
      textScaleFactor: _textScaleFactor,
      maxLines: _maxLines,
      style: _styles?.map((e) => e.resolve(mix)).fold(
            const TextStyle(),
            (previousValue, element) => previousValue?.merge(element),
          ),
      textWidthBasis: _textWidthBasis,
      textHeightBehavior: _textHeightBehavior,
      textDirection: _textDirection?.resolve(mix),
      directives: _directives,
    );
  }

  @override
  get props => [
        _styles,
        _strutStyle,
        _textAlign,
        _locale,
        _softWrap,
        _overflow,
        _textScaleFactor,
        _maxLines,
        _textWidthBasis,
        _textHeightBehavior,
        _directives,
      ];
}

class TextSpec extends Spec<TextSpec> {
  final bool softWrap;
  final TextOverflow overflow;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final Locale? locale;
  final double? textScaleFactor;
  final int? maxLines;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final TextStyle? style;
  final TextDirection? textDirection;

  final List<TextDirective> directives;
  const TextSpec({
    required this.softWrap,
    required this.overflow,
    this.strutStyle,
    this.textAlign,
    this.locale,
    this.textScaleFactor,
    this.maxLines,
    this.style,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.textDirection,
    this.directives = const [],
  });

  String applyTextDirectives(String? text) {
    if (text == null) return '';

    String modifiedText = text;
    for (final directive in directives) {
      modifiedText = directive.modify(modifiedText);
    }

    return modifiedText;
  }

  @override
  TextSpec lerp(TextSpec other, double t) {
    // Define a helper method for snapping

    return TextSpec(
      softWrap: snap(softWrap, other.softWrap, t),
      overflow: snap(overflow, other.overflow, t),
      strutStyle: snap(strutStyle, other.strutStyle, t),
      textAlign: snap(textAlign, other.textAlign, t),
      locale: snap(locale, other.locale, t),
      textScaleFactor:
          genericNumLerp(textScaleFactor, other.textScaleFactor, t),
      maxLines: snap(maxLines, other.maxLines, t),
      style: TextStyle.lerp(style, other.style, t),
      textWidthBasis: snap(textWidthBasis, other.textWidthBasis, t),
      textHeightBehavior: snap(textHeightBehavior, other.textHeightBehavior, t),
      directives: snap(directives, other.directives, t),
    );
  }

  @override
  TextSpec copyWith({
    bool? softWrap,
    TextOverflow? overflow,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    Locale? locale,
    double? textScaleFactor,
    int? maxLines,
    TextStyle? style,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    List<TextDirective>? directives,
    TextDirection? textDirection,
  }) {
    return TextSpec(
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      strutStyle: strutStyle ?? this.strutStyle,
      textAlign: textAlign ?? this.textAlign,
      locale: locale ?? this.locale,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      maxLines: maxLines ?? this.maxLines,
      style: style ?? this.style,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
      textDirection: textDirection ?? this.textDirection,
      directives: [...this.directives, ...directives ?? []],
    );
  }

  @override
  List<Object?> get props => [
        softWrap,
        overflow,
        strutStyle,
        textAlign,
        locale,
        textScaleFactor,
        maxLines,
        textWidthBasis,
        textHeightBehavior,
        style,
        directives,
        textDirection,
      ];
}
