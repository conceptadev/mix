import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/directives/text/text_directive.attributes.dart';

class TextMixer {
  final bool softWrap;
  final TextOverflow overflow;
  final List<TextDirectiveAttribute> directives;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final Locale? locale;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  const TextMixer({
    required this.softWrap,
    required this.overflow,
    required this.directives,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.locale,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
  });

  factory TextMixer.fromContext(MixContext mixContext) {
    final mix = mixContext.mix;
    final text = mix.textAttribute;
    // Get all text directives
    final directives = mix.directives.whereType<TextDirectiveAttribute>();
    return TextMixer(
      style: text?.style,
      strutStyle: text?.strutStyle,
      textAlign: text?.textAlign,
      locale: text?.locale,
      softWrap: text?.softWrap ?? true,
      overflow: text?.overflow ?? TextOverflow.clip,
      textScaleFactor: text?.textScaleFactor,
      maxLines: text?.maxLines,
      semanticsLabel: text?.semanticsLabel,
      textWidthBasis: text?.textWidthBasis,
      textHeightBehavior: text?.textHeightBehavior,
      directives: directives.toList(),
    );
  }

  String applyTextDirectives(String? text) {
    if (text == null) return '';

    var modifiedText = text;
    for (final dir in directives) {
      modifiedText = dir.modify(modifiedText);
    }

    return modifiedText;
  }
}
