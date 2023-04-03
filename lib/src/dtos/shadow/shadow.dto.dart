import 'package:flutter/material.dart';

import '../../../mix.dart';
import '../../helpers/mergeable_list.dart';
import '../color.dto.dart';
import '../dto.dart';

class ShadowDto<T extends Shadow> extends Dto<T>
    with MergeableMixin<ShadowDto> {
  final ColorDto? color;
  final Offset? offset;
  final double? blurRadius;

  const ShadowDto({
    this.color,
    this.offset,
    this.blurRadius,
  });

  factory ShadowDto.from(Shadow shadow) {
    return ShadowDto(
      blurRadius: shadow.blurRadius,
      color: ColorDto.maybeFrom(shadow.color),
      offset: shadow.offset,
    );
  }

  static maybeFrom(Shadow? shadow) {
    if (shadow == null) {
      return null;
    }

    return ShadowDto.from(shadow);
  }

  @override
  T resolve(MixData mix) {
    return Shadow(
      color: color?.resolve(mix) ?? const Shadow().color,
      offset: offset ?? const Shadow().offset,
      blurRadius: blurRadius ?? const Shadow().blurRadius,
    ) as T;
  }

  ShadowDto copyWith({
    ColorDto? color,
    Offset? offset,
    double? blurRadius,
  }) {
    return ShadowDto(
      color: color ?? this.color,
      offset: offset ?? this.offset,
      blurRadius: blurRadius ?? this.blurRadius,
    );
  }

  @override
  ShadowDto merge(covariant ShadowDto? other) {
    return copyWith(
      color: other?.color,
      offset: other?.offset,
      blurRadius: other?.blurRadius,
    );
  }

  @override
  get props => [color, offset, blurRadius];
}

extension ShadowDtoExt on List<ShadowDto> {
  List<Shadow> resolve(MixData mix) {
    return map((e) => e.resolve(mix)).toList();
  }

  List<ShadowDto> merge(List<ShadowDto>? other) {
    return combineMergeableLists(this, other);
  }
}
