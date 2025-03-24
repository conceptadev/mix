// ignore_for_file: avoid-importing-entrypoint-exports, avoid-unused-ignores, prefer_relative_imports

import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../../mix.dart';

part 'strut_style_dto.g.dart';

@MixableProperty()
final class StrutStyleMix extends Mixable<StrutStyle> with _$StrutStyleMix {
  @MixableField(utilities: [MixableFieldUtility(type: FontFamilyUtility)])
  final String? fontFamily;
  final List<String>? fontFamilyFallback;

  @MixableField(utilities: [MixableFieldUtility(type: FontSizeUtility)])
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? height;
  final double? leading;
  final bool? forceStrutHeight;

  const StrutStyleMix({
    this.fontFamily,
    this.fontFamilyFallback,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.height,
    this.leading,
    this.forceStrutHeight,
  });
}
