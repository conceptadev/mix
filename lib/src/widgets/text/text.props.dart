import 'package:flutter/material.dart';
import '../../mixer/mix_context.dart';
import '../../theme/refs/color_token.dart';
import '../../theme/refs/text_style_token.dart';
import 'text.attributes.dart';

class TextProps {
  final bool softWrap;
  final TextOverflow overflow;

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

  factory TextProps.fromContext(MixContext mixContext) {
    final textAttributes = mixContext.fromType<TextAttributes>();

    final context = mixContext.context;

    TextStyle? finalStyle = textAttributes?.style;
    TextStyle? refStyle = textAttributes?.styleRef?.resolve(context);

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
      strutStyle: textAttributes?.strutStyle,
      textAlign: textAttributes?.textAlign,
      locale: textAttributes?.locale,
      softWrap: textAttributes?.softWrap ?? true,
      overflow: textAttributes?.overflow ?? TextOverflow.clip,
      textScaleFactor: textAttributes?.textScaleFactor,
      maxLines: textAttributes?.maxLines,
      textWidthBasis: textAttributes?.textWidthBasis,
      textHeightBehavior: textAttributes?.textHeightBehavior,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TextProps &&
        other.softWrap == softWrap &&
        other.overflow == overflow &&
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
