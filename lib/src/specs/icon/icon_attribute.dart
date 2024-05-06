import 'dart:ui';

import '../../attributes/color/color_dto.dart';
import '../../attributes/shadow/shadow_dto.dart';
import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'icon_spec.dart';

class IconSpecAttribute extends SpecAttribute<IconSpec> {
  final ColorDto? color;
  final double? size;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final List<ShadowDto>? shadows;
  final TextDirection? textDirection;
  final double? fill;
  final bool? applyTextScaling;

  const IconSpecAttribute({
    this.size,
    this.color,
    this.weight,
    this.grade,
    this.opticalSize,
    this.shadows,
    this.fill,
    this.textDirection,
    this.applyTextScaling,
  });

  @override
  IconSpec resolve(MixData mix) {
    return IconSpec(
      color: color?.resolve(mix),
      size: size,
      weight: weight,
      grade: grade,
      opticalSize: opticalSize,
      shadows: shadows?.map((e) => e.resolve(mix)).toList(),
      textDirection: textDirection,
      applyTextScaling: applyTextScaling,
      fill: fill,
    );
  }

  @override
  IconSpecAttribute merge(covariant IconSpecAttribute? other) {
    if (other == null) return this;

    return IconSpecAttribute(
      size: other.size ?? size,
      color: color?.merge(other.color) ?? other.color,
      weight: other.weight ?? weight,
      grade: other.grade ?? grade,
      opticalSize: other.opticalSize ?? opticalSize,
      shadows: other.shadows ?? shadows,
      fill: other.fill ?? fill,
      textDirection: other.textDirection ?? textDirection,
      applyTextScaling: other.applyTextScaling ?? applyTextScaling,
    );
  }

  @override
  get props => [
        size,
        color,
        weight,
        grade,
        opticalSize,
        shadows,
        textDirection,
        applyTextScaling,
      ];
}
