import 'package:flutter/material.dart';

import '../../attributes/exports.dart';
import '../../factory/exports.dart';
import '../color.dto.dart';
import '../dto.dart';

class ShadowDto<T extends Shadow> extends ResolvableAttribute<T>
    with MergeMixin {
  final ColorDto? color;
  final Offset? offset;
  final double? blurRadius;

  const ShadowDto({this.blurRadius, this.color, this.offset});

  factory ShadowDto.from(Shadow shadow) {
    return ShadowDto(
      blurRadius: shadow.blurRadius,
      color: ColorDto.maybeFrom(shadow.color),
      offset: shadow.offset,
    );
  }

  static maybeFrom(Shadow? shadow) {
    return shadow == null ? null : ShadowDto.from(shadow);
  }

  ShadowDto copyWith({double? blurRadius, ColorDto? color, Offset? offset}) {
    return ShadowDto(
      blurRadius: blurRadius ?? this.blurRadius,
      color: color ?? this.color,
      offset: offset ?? this.offset,
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
  ShadowDto merge(covariant ShadowDto? other) {
    return copyWith(
      blurRadius: other?.blurRadius,
      color: other?.color,
      offset: other?.offset,
    );
  }

  @override
  get props => [color, offset, blurRadius];
}
