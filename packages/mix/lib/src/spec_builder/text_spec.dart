import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../mix.dart';

part 'text_spec.spec.dart';

@MixableSpec()
class TextDef extends Spec<TextDef> with TextDefMixable {
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
  @MixableFieldUtility(properties: [
    MixableFieldProperty('capitalize'),
    MixableFieldProperty('uppercase'),
    MixableFieldProperty('lowercase'),
    MixableFieldProperty('titleCase'),
    MixableFieldProperty('sentenceCase'),
  ])
  final TextDirective? directive;

  const TextDef({
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
}
