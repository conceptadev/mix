import 'package:flutter/material.dart';

import '../core/directives/text_directive.dart';
import '../core/style_attribute.dart';
import '../factory/exports.dart';

class TextSpec extends MixExtension<TextSpec> {
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

  static TextSpec resolve(MixData mix) {
    return TextSpec(softWrap: mix.get<SoftWrapAttribute, bool>());
  }

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
