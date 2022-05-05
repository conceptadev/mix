import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../theme/refs/color_token.dart';
import '../../theme/refs/text_style_token.dart';
import '../exports.dart';

class TextProps {
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

  const TextProps({
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

  factory TextProps.fromContext(
    BuildContext context,
    TextAttributes? attributes,
    Iterable<TextDirectiveAttribute> directives,
  ) {
    final text = attributes;
    // Get all text directives

    TextStyle? finalStyle = text?.style;
    TextStyle? refStyle = text?.styleRef?.resolve(context);

    if (finalStyle is TextStyleToken) {
      finalStyle = finalStyle.resolve(context);
    }

    if (refStyle != null) {
      finalStyle = refStyle.merge(finalStyle);
    }

    var color = finalStyle?.color;
    if (color is ColorToken) {
      // Also build color ref
      finalStyle = finalStyle?.copyWith(
        color: color.resolve(context),
      );
    }

    return TextProps(
      // Need to grab colorscheme from context
      style: finalStyle,
      strutStyle: text?.strutStyle,
      textAlign: text?.textAlign,
      locale: text?.locale,
      softWrap: text?.softWrap ?? true,
      overflow: text?.overflow ?? TextOverflow.clip,
      textScaleFactor: text?.textScaleFactor,
      maxLines: text?.maxLines,
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

    return other is TextProps &&
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
