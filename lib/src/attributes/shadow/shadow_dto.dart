import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../color/color_dto.dart';

@immutable
abstract class ShadowDtoImpl<Self extends ShadowDtoImpl<Self, Value>,
    Value extends Shadow> extends Dto<Value> with Mergeable<Self> {
  final ColorDto? color;
  final Offset? offset;
  final double? blurRadius;

  const ShadowDtoImpl({this.blurRadius, this.color, this.offset});

  @override
  Value resolve(MixData mix);

  @override
  Self merge(covariant Self? other);
}

@immutable
class ShadowDto extends ShadowDtoImpl<ShadowDto, Shadow> {
  const ShadowDto({super.blurRadius, super.color, super.offset});

  static ShadowDto from(Shadow shadow) {
    return ShadowDto(
      blurRadius: shadow.blurRadius,
      color: ColorDto.maybeFrom(shadow.color),
      offset: shadow.offset,
    );
  }

  static ShadowDto? maybeFrom(Shadow? shadow) {
    return shadow == null ? null : from(shadow);
  }

  @override
  Shadow resolve(MixData mix) {
    const defaultShadow = Shadow();

    return Shadow(
      color: color?.resolve(mix) ?? defaultShadow.color,
      offset: offset ?? defaultShadow.offset,
      blurRadius: blurRadius ?? defaultShadow.blurRadius,
    );
  }

  @override
  ShadowDto merge(covariant ShadowDto? other) {
    if (other == null) return this;

    return ShadowDto(
      blurRadius: other.blurRadius ?? blurRadius,
      color: other.color ?? color,
      offset: other.offset ?? offset,
    );
  }

  @override
  get props => [color, offset, blurRadius];
}

class BoxShadowDto extends ShadowDtoImpl<BoxShadowDto, BoxShadow> {
  final double? spreadRadius;

  const BoxShadowDto({
    super.color,
    super.offset,
    super.blurRadius,
    this.spreadRadius,
  });

  static BoxShadowDto from(BoxShadow shadow) {
    return BoxShadowDto(
      color: ColorDto.maybeFrom(shadow.color),
      offset: shadow.offset,
      blurRadius: shadow.blurRadius,
      spreadRadius: shadow.spreadRadius,
    );
  }

  static BoxShadowDto? maybeFrom(BoxShadow? shadow) {
    return shadow == null ? null : from(shadow);
  }

  @override
  BoxShadow resolve(MixData mix) {
    const defaultShadow = BoxShadow();

    return BoxShadow(
      color: color?.resolve(mix) ?? defaultShadow.color,
      offset: offset ?? defaultShadow.offset,
      blurRadius: blurRadius ?? defaultShadow.blurRadius,
      spreadRadius: spreadRadius ?? defaultShadow.spreadRadius,
    );
  }

  @override
  BoxShadowDto merge(BoxShadowDto? other) {
    if (other == null) return this;

    return BoxShadowDto(
      color: other.color ?? color,
      offset: other.offset ?? offset,
      blurRadius: other.blurRadius ?? blurRadius,
      spreadRadius: other.spreadRadius ?? spreadRadius,
    );
  }

  @override
  get props => [color, offset, blurRadius, spreadRadius];
}
