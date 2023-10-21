import 'package:flutter/material.dart';

import '../core/dto/color.dto.dart';
import '../factory/mix_provider_data.dart';
import 'style_attribute.dart';

class ShadowAttribute<T extends Shadow> extends StyleAttribute<Shadow> {
  final ColorDto? color;
  final Offset? offset;
  final double? blurRadius;

  const ShadowAttribute({this.blurRadius, this.color, this.offset});

  factory ShadowAttribute.from(Shadow shadow) {
    return ShadowAttribute(
      blurRadius: shadow.blurRadius,
      color: ColorDto(shadow.color),
      offset: shadow.offset,
    );
  }

  @override
  T resolve(MixData mix) {
    const defaultShadow = Shadow();

    return Shadow(
      color: color?.resolve(mix) ?? defaultShadow.color,
      offset: offset ?? defaultShadow.offset,
      blurRadius: blurRadius ?? defaultShadow.blurRadius,
    ) as T;
  }

  @override
  ShadowAttribute merge(ShadowAttribute? other) {
    return ShadowAttribute(
      blurRadius: other?.blurRadius ?? blurRadius,
      color: mergeAttr(color, other?.color),
      offset: other?.offset ?? offset,
    );
  }

  @override
  get props => [color, offset, blurRadius];
}
