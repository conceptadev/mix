import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import '../attribute.dart';
import 'color_dto.dart';

class ShadowDto<T extends Shadow> extends Dto<Shadow> {
  final ColorDto? color;
  final Offset? offset;
  final double? blurRadius;

  const ShadowDto({this.blurRadius, this.color, this.offset});

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
  ShadowDto merge(ShadowDto? other) {
    return ShadowDto(
      blurRadius: other?.blurRadius ?? blurRadius,
      color: mergeAttr(color, other?.color),
      offset: other?.offset ?? offset,
    );
  }

  @override
  get props => [color, offset, blurRadius];
}

class BoxShadowDto extends ShadowDto<BoxShadow> {
  final double? spreadRadius;

  const BoxShadowDto({
    super.color,
    super.offset,
    super.blurRadius,
    this.spreadRadius,
  });

  @override
  BoxShadow resolve(MixData mix) {
    const defaultShadow = BoxShadow();

    final shadow = super.resolve(mix);

    return BoxShadow(
      color: shadow.color,
      offset: shadow.offset,
      blurRadius: shadow.blurRadius,
      spreadRadius: spreadRadius ?? defaultShadow.spreadRadius,
    );
  }

  @override
  BoxShadowDto merge(BoxShadowDto? other) {
    return BoxShadowDto(
      color: mergeAttr(color, other?.color),
      offset: other?.offset ?? offset,
      blurRadius: other?.blurRadius ?? blurRadius,
      spreadRadius: other?.spreadRadius ?? spreadRadius,
    );
  }

  @override
  get props => [...super.props, spreadRadius];
}
