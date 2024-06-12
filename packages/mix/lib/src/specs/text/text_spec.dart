import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../../mix.dart';

part 'text_spec.g.dart';

@MixableSpec()
final class TextSpec extends Spec<TextSpec> with TextSpecMixable {
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

  @MixableField(
    utility: MixableFieldUtility(properties: [
      MixableFieldProperty('uppercase'),
      MixableFieldProperty('lowercase'),
      MixableFieldProperty('capitalize'),
      MixableFieldProperty('titleCase'),
      MixableFieldProperty('sentenceCase'),
    ]),
  )
  final TextDirective? directive;

  static const of = TextSpecMixable.of;

  static const from = TextSpecMixable.from;

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
    super.animated,
  });
}
