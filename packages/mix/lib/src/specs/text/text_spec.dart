import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../core/attribute.dart';
import '../../core/directive.dart';
import '../../core/models/animated_data.dart';
import '../../core/models/mix_data.dart';
import '../../core/spec.dart';
import '../../exports/dtos.dart';
import '../../exports/utilities.dart';
import '../../factory/mix_provider.dart';

part 'text_spec.g.dart';

@MixableSpec()
class TextSpec extends Spec<TextSpec> with TextSpecMixable {
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
