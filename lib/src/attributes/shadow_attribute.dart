import 'package:flutter/material.dart';

import '../core/dto/color_dto.dart';
import '../core/dto/double_dto.dart';
import '../core/style_attribute.dart';
import '../factory/mix_provider_data.dart';

class ShadowAttribute<T extends Shadow> extends StyleAttribute<Shadow> {
  final ColorDto? color;
  final Offset? offset;
  final DoubleDto? blurRadius;

  const ShadowAttribute({this.blurRadius, this.color, this.offset});

  static ShadowAttribute from(Shadow shadow) {
    return (shadow is BoxShadow)
        ? BoxShadowAttribute.fromBoxShadow(shadow)
        : ShadowAttribute(
            blurRadius: DoubleDto(shadow.blurRadius),
            color: ColorDto(shadow.color),
            offset: shadow.offset,
          );
  }

  @override
  T resolve(MixData mix) {
    const defaultShadow = Shadow();

    return Shadow(
      color: resolveDto(color, mix),
      offset: offset ?? defaultShadow.offset,
      blurRadius: resolveDto(blurRadius, mix),
    ) as T;
  }

  @override
  ShadowAttribute merge(ShadowAttribute? other) {
    return ShadowAttribute(
      blurRadius: mergeAttr(blurRadius, other?.blurRadius),
      color: mergeAttr(color, other?.color),
      offset: other?.offset ?? offset,
    );
  }

  @override
  get props => [color, offset, blurRadius];
}

class BoxShadowAttribute extends ShadowAttribute<BoxShadow> {
  final DoubleDto? spreadRadius;

  const BoxShadowAttribute({
    super.color,
    super.offset,
    super.blurRadius,
    this.spreadRadius,
  });

  factory BoxShadowAttribute.fromBoxShadow(BoxShadow boxShadow) {
    return BoxShadowAttribute(
      color: ColorDto(boxShadow.color),
      offset: boxShadow.offset,
      blurRadius: DoubleDto(boxShadow.blurRadius),
      spreadRadius: DoubleDto(boxShadow.spreadRadius),
    );
  }

  @override
  BoxShadow resolve(MixData mix) {
    const defaultShadow = BoxShadow();

    return BoxShadow(
      color: resolveDto(color, mix) ?? defaultShadow.color,
      offset: offset ?? defaultShadow.offset,
      blurRadius: resolveDto(blurRadius, mix) ?? defaultShadow.blurRadius,
      spreadRadius: resolveDto(spreadRadius, mix) ?? defaultShadow.spreadRadius,
    );
  }

  @override
  BoxShadowAttribute merge(BoxShadowAttribute? other) {
    return BoxShadowAttribute(
      color: mergeAttr(color, other?.color),
      offset: other?.offset ?? offset,
      blurRadius: mergeAttr(blurRadius, other?.blurRadius),
      spreadRadius: other?.spreadRadius ?? spreadRadius,
    );
  }

  @override
  get props => [...super.props, spreadRadius];
}
