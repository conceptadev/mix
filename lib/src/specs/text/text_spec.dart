import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/directive.dart';
import '../../factory/mix_provider.dart';
import '../../factory/mix_provider_data.dart';
import '../../helpers/lerp_helpers.dart';
import 'text_attribute.dart';

class TextSpec extends Spec<TextSpec> {
  final TextOverflow? overflow;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final int? maxLines;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final TextStyle? style;
  final TextDirection? textDirection;
  final bool? softWrap;
  final TextDirective? directive;

  const TextSpec({
    this.overflow,
    this.strutStyle,
    this.textAlign,
    this.textScaleFactor,
    this.maxLines,
    this.style,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.textDirection,
    this.softWrap,
    this.directive,
    super.animatedData,
  });

  // empty
  const TextSpec.empty()
      : overflow = null,
        strutStyle = null,
        textAlign = null,
        textScaleFactor = null,
        maxLines = null,
        style = null,
        textWidthBasis = null,
        textHeightBehavior = null,
        textDirection = null,
        directive = null,
        softWrap = null;

  static TextSpec of(BuildContext context) {
    final mix = Mix.of(context);

    return mix.attributeOf<TextSpecAttribute>()?.resolve(mix) ??
        const TextSpec.empty();
  }

  static TextSpec from(MixData mix) =>
      mix.attributeOf<TextSpecAttribute>()?.resolve(mix) ??
      const TextSpec.empty();

  @override
  TextSpec lerp(TextSpec? other, double t) {
    if (other == null) return this;
    // Define a helper method for snapping

    return TextSpec(
      overflow: lerpSnap(overflow, other.overflow, t),
      strutStyle: lerpStrutStyle(strutStyle, other.strutStyle, t),
      textAlign: lerpSnap(textAlign, other.textAlign, t),
      textScaleFactor: lerpDouble(textScaleFactor, other.textScaleFactor, t),
      maxLines: lerpSnap(maxLines, other.maxLines, t),
      style: lerpTextStyle(style, other.style, t),
      textWidthBasis: lerpSnap(textWidthBasis, other.textWidthBasis, t),
      textHeightBehavior:
          lerpSnap(textHeightBehavior, other.textHeightBehavior, t),
      textDirection: lerpSnap(textDirection, other.textDirection, t),
      softWrap: lerpSnap(softWrap, other.softWrap, t),
      directive: lerpSnap(directive, other.directive, t),
    );
  }

  @override
  TextSpec copyWith({
    bool? softWrap,
    TextOverflow? overflow,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    double? textScaleFactor,
    int? maxLines,
    TextStyle? style,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    TextDirection? textDirection,
    TextDirective? directive,
    AnimatedData? animatedData,
  }) {
    return TextSpec(
      overflow: overflow ?? this.overflow,
      strutStyle: strutStyle ?? this.strutStyle,
      textAlign: textAlign ?? this.textAlign,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      maxLines: maxLines ?? this.maxLines,
      style: style ?? this.style,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
      textDirection: textDirection ?? this.textDirection,
      softWrap: softWrap ?? this.softWrap,
      directive: directive ?? this.directive,
      animatedData: animatedData ?? this.animatedData,
    );
  }

  @override
  List<Object?> get props => [
        softWrap,
        overflow,
        strutStyle,
        textAlign,
        textScaleFactor,
        maxLines,
        textWidthBasis,
        textHeightBehavior,
        style,
        textDirection,
        directive,
      ];
}

class TextSpecTween extends Tween<TextSpec> {
  TextSpecTween({TextSpec? begin, TextSpec? end})
      : super(begin: begin, end: end);

  @override
  TextSpec lerp(double t) => begin!.lerp(end, t);
}
