import 'package:flutter/material.dart';

import '../../factory/exports.dart';
import '../base/color.attribute.dart';
import '../resolvable_attribute.dart';

class ShadowAttribute<T extends Shadow> extends ResolvableAttribute<Shadow> {
  final ColorAttribute? color;
  final Offset? offset;
  final double? blurRadius;

  const ShadowAttribute({this.blurRadius, this.color, this.offset});

  factory ShadowAttribute.from(Shadow shadow) {
    return ShadowAttribute(
      blurRadius: shadow.blurRadius,
      color: ColorAttribute(shadow.color),
      offset: shadow.offset,
    );
  }

  @override
  T resolve(MixData mix) {
    const defaultShadow = Shadow();

    return Shadow(
      color: resolveAttribute(color, mix) ?? defaultShadow.color,
      offset: offset ?? defaultShadow.offset,
      blurRadius: blurRadius ?? defaultShadow.blurRadius,
    ) as T;
  }

  @override
  ShadowAttribute merge(ShadowAttribute? other) {
    return ShadowAttribute(
      blurRadius: other?.blurRadius ?? blurRadius,
      color: mergeAttribute(color, other?.color),
      offset: other?.offset ?? offset,
    );
  }

  @override
  get props => [color, offset, blurRadius];
}
