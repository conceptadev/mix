import 'package:flutter/material.dart';

import '../../../factory/exports.dart';
import '../../helpers/list.attribute.dart';
import '../../style_attribute.dart';
import '../directives/text.directive.dart';
import '../text_style/text_style.attribute.dart';

class TextAttributes extends StyleAttribute<TextSpec> {
  final List<TextDirective> _directives;
  final TextHeightBehavior? _textHeightBehavior;
  final int? _maxLines;
  final TextWidthBasis? _textWidthBasis;
  final double? _textScaleFactor;
  final TextOverflow? _overflow;
  final TextAlign? _textAlign;
  final bool? _softWrap;
  final Locale? _locale;
  final StrutStyle? _strutStyle;
  final ListAtttribute<TextStyleAttribute>? _styles;

  const TextAttributes({
    List<TextDirective> directives = const [],
    Locale? locale,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
    StrutStyle? strutStyle,
    ListAtttribute<TextStyleAttribute>? styles,
    TextAlign? textAlign,
    TextHeightBehavior? textHeightBehavior,
    double? textScaleFactor,
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
  }) {
    return TextAttributes(
      directives: directives ?? const [],
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      strutStyle: strutStyle,
      styles: ListAtttribute.maybeFrom(styles?.map(TextStyleAttribute.from)),
      textAlign: textAlign,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
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
      styles: _styles?.merge(other._styles) ?? other._styles,
      textAlign: other._textAlign ?? _textAlign,
      textHeightBehavior: other._textHeightBehavior ?? _textHeightBehavior,
      textScaleFactor: other._textScaleFactor ?? _textScaleFactor,
      textWidthBasis: other._textWidthBasis ?? _textWidthBasis,
    );
  }

  @override
  TextSpec resolve(MixData mix) {
    return TextSpec(
      softWrap: _softWrap ?? true,
      overflow: _overflow ?? TextOverflow.clip,
      strutStyle: _strutStyle,
      textAlign: _textAlign,
      locale: _locale,
      textScaleFactor: _textScaleFactor,
      maxLines: _maxLines,
      style: _styles
          ?.resolve(mix)
          .map((e) => e.resolve(mix))
          .reduce((a, b) => a.merge(b)),
      textWidthBasis: _textWidthBasis,
      textHeightBehavior: _textHeightBehavior,
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
  final List<TextDirective> _directives;

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
  TextSpec lerp(TextSpec other, double t) {
    // Define a helper method for snapping
    T snap<T>(T from, T to) => t < 0.5 ? from : to;

    return TextSpec(
      softWrap: snap(softWrap, other.softWrap),
      overflow: snap(overflow, other.overflow),
      strutStyle: snap(strutStyle, other.strutStyle),
      textAlign: snap(textAlign, other.textAlign),
      locale: snap(locale, other.locale),
      textScaleFactor: t < 0.5
          ? textScaleFactor
          : (textScaleFactor! * t + other.textScaleFactor! * (1 - t)),
      maxLines: snap(maxLines, other.maxLines),
      style: TextStyle.lerp(style, other.style, t),
      textWidthBasis: snap(textWidthBasis, other.textWidthBasis),
      textHeightBehavior: snap(textHeightBehavior, other.textHeightBehavior),
      directives: snap(_directives, other._directives),
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
      directives: directives ?? _directives,
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
        _directives,
      ];
}
