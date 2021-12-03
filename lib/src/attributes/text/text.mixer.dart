import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/src/attributes/directives/text/text_directive.attributes.dart';
import 'package:mix/src/attributes/exports.dart';
import 'package:mix/src/theme/refs/refs.dart';

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

  factory TextMixer.fromContext(
    BuildContext context,
    TextAttributes? attributes,
    Iterable<TextDirectiveAttribute> directives,
  ) {
    final text = attributes;
    // Get all text directives

    var color = text?.style?.color;

    if (color is ColorRef) {
      color = color.create(context);
    }

    return TextMixer(
      // Need to grab colorscheme from context
      style: text?.style?.copyWith(
        color: color,
      ),
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextMixer &&
        other.softWrap == softWrap &&
        other.overflow == overflow &&
        listEquals(other.directives, directives) &&
        other.style == style &&
        other.strutStyle == strutStyle &&
        other.textAlign == textAlign &&
        other.locale == locale &&
        other.textScaleFactor == textScaleFactor &&
        other.maxLines == maxLines &&
        other.semanticsLabel == semanticsLabel &&
        other.textWidthBasis == textWidthBasis &&
        other.textHeightBehavior == textHeightBehavior;
  }

  @override
  int get hashCode {
    return softWrap.hashCode ^
        overflow.hashCode ^
        directives.hashCode ^
        style.hashCode ^
        strutStyle.hashCode ^
        textAlign.hashCode ^
        locale.hashCode ^
        textScaleFactor.hashCode ^
        maxLines.hashCode ^
        semanticsLabel.hashCode ^
        textWidthBasis.hashCode ^
        textHeightBehavior.hashCode;
  }
}
