import 'package:flutter/material.dart';

import '../../attributes/strut_style/strut_style_dto.dart';
import '../../attributes/text_style/text_style_dto.dart';
import '../../core/directive.dart';
import '../../core/models/mix_data.dart';
import '../../core/spec.dart';
import 'text_spec.dart';

class TextSpecAttribute extends SpecAttribute<TextSpec> {
  const TextSpecAttribute({
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
    super.animated,
  });

  final TextOverflow? overflow;

  final StrutStyleDto? strutStyle;

  final TextAlign? textAlign;

  final double? textScaleFactor;

  final int? maxLines;

  final TextStyleDto? style;

  final TextWidthBasis? textWidthBasis;

  final TextHeightBehavior? textHeightBehavior;

  final TextDirection? textDirection;

  final bool? softWrap;

  final TextDirective? directive;

  @override
  TextSpec resolve(MixData mix) {
    return TextSpec(
      overflow: overflow,
      strutStyle: strutStyle?.resolve(mix),
      textAlign: textAlign,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      style: style?.resolve(mix),
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      textDirection: textDirection,
      softWrap: softWrap,
      directive: directive,
      animated: animated?.resolve(mix),
    );
  }

  @override
  TextSpecAttribute merge(TextSpecAttribute? other) {
    if (other == null) return this;

    return TextSpecAttribute(
      overflow: other.overflow ?? overflow,
      strutStyle: strutStyle?.merge(other.strutStyle) ?? other.strutStyle,
      textAlign: other.textAlign ?? textAlign,
      textScaleFactor: other.textScaleFactor ?? textScaleFactor,
      maxLines: other.maxLines ?? maxLines,
      style: style?.merge(other.style) ?? other.style,
      textWidthBasis: other.textWidthBasis ?? textWidthBasis,
      textHeightBehavior: other.textHeightBehavior ?? textHeightBehavior,
      textDirection: other.textDirection ?? textDirection,
      softWrap: other.softWrap ?? softWrap,
      directive: other.directive ?? directive,
      animated: animated?.merge(other.animated) ?? other.animated,
    );
  }

  /// The list of properties that constitute the state of this [TextSpecAttribute].
  ///
  /// This property is used by the [==] operator and the [hashCode] getter to
  /// compare two [TextSpecAttribute] instances for equality.
  @override
  List<Object?> get props {
    return [
      overflow,
      strutStyle,
      textAlign,
      textScaleFactor,
      maxLines,
      style,
      textWidthBasis,
      textHeightBehavior,
      textDirection,
      softWrap,
      directive,
      animated,
    ];
  }
}
