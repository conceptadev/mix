import 'package:flutter/material.dart';
import 'package:mix/annotations.dart';

// ignore: avoid-importing-entrypoint-exports
import '../../../mix.dart';

part 'strut_style_dto.g.dart';

@MixableDto()
final class StrutStyleDto extends Dto<StrutStyle> with _$StrutStyleDto {
  @MixableField(utility: MixableFieldUtility(type: FontFamilyUtility))
  final String? fontFamily;
  final List<String>? fontFamilyFallback;

  @MixableField(utility: MixableFieldUtility(type: FontSizeUtility))
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? height;
  final double? leading;
  final bool? forceStrutHeight;

  const StrutStyleDto({
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
