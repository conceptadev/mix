import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../attributes/common/common.props.dart';
import '../../mixer/mix_context_data.dart';
import '../../theme/refs/color_token.dart';
import '../../theme/refs/text_style_token.dart';
import 'text.attributes.dart';
import 'text_directives/text_directive.attributes.dart';

class TextProps extends CommonProps {
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
  final List<TextDirectiveAttribute> directives;

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
    this.directives = const [],
    required bool animated,
    required Duration animationDuration,
    required Curve animationCurve,
    required bool visible,
    TextDirection? textDirection,
  }) : super(
          visible: visible,
          animated: animated,
          animationDuration: animationDuration,
          animationCurve: animationCurve,
          textDirection: textDirection,
        );

  factory TextProps.fromContext(MixContextData mixContext) {
    final textAttributes = mixContext.attributesOfType<TextAttributes>();
    final commonProps = CommonProps.fromContext(mixContext);

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

    final textDirectives =
        mixContext.directivesOfType<TextDirectiveAttribute>().toList();

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
      // Directives
      directives: textDirectives,
      // Common Props
      visible: commonProps.visible,
      animated: commonProps.animated,
      animationDuration: commonProps.animationDuration,
      animationCurve: commonProps.animationCurve,
      textDirection: commonProps.textDirection,
    );
  }

  String applyTextDirectives(
    String? text,
  ) {
    if (text == null) return '';

    var modifiedText = text;
    for (final directive in directives) {
      modifiedText = directive.modify(modifiedText);
    }

    return modifiedText;
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
        other.textHeightBehavior == textHeightBehavior &&
        other.visible == visible &&
        other.animated == animated &&
        other.animationDuration == animationDuration &&
        other.animationCurve == animationCurve &&
        other.textDirection == textDirection &&
        listEquals(other.directives, directives);
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
        textHeightBehavior.hashCode ^
        visible.hashCode ^
        animated.hashCode ^
        animationDuration.hashCode ^
        animationCurve.hashCode ^
        textDirection.hashCode ^
        directives.hashCode;
  }
}
