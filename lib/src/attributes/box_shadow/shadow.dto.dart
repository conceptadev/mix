import 'package:flutter/material.dart';

import '../../factory/exports.dart';
import '../color/color_dto.dart';
import '../resolvable_attribute.dart';

class ShadowDto<T extends Shadow> extends ResolvableDto<Shadow> {
  final ColorDto? color;
  final Offset? offset;
  final double? blurRadius;

  const ShadowDto({this.blurRadius, this.color, this.offset});

  factory ShadowDto.from(Shadow shadow) {
    return ShadowDto(
      blurRadius: shadow.blurRadius,
      color: ColorDto.from(shadow.color),
      offset: shadow.offset,
    );
  }

  @override
  T resolve(MixData mix) {
    return Shadow(
      color: color?.resolve(mix) ?? const Shadow().color,
      offset: offset ?? const Shadow().offset,
      blurRadius: blurRadius ?? const Shadow().blurRadius,
    ) as T;
  }

  @override
  ShadowDto merge(ShadowDto? other) {
    return ShadowDto(
      blurRadius: other?.blurRadius ?? blurRadius,
      color: color?.merge(other?.color) ?? color,
      offset: other?.offset ?? offset,
    );
  }

  @override
  get props => [color, offset, blurRadius];
}
