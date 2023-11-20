import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';
import 'color_attribute.dart';

class ShadowDto<Value extends Shadow> extends Dto<ShadowDto>
    with Resolver<Value> {
  final ColorAttribute? color;
  final Offset? offset;
  final double? blurRadius;

  const ShadowDto({this.blurRadius, this.color, this.offset});

  @override
  Value resolve(MixData mix) {
    const defaultShadow = Shadow();

    return Shadow(
      color: color?.resolve(mix) ?? defaultShadow.color,
      offset: offset ?? defaultShadow.offset,
      blurRadius: blurRadius ?? defaultShadow.blurRadius,
    ) as Value;
  }

  @override
  ShadowDto<Value> merge(covariant ShadowDto<Value>? other) {
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
    if (other == null) return this;
    return BoxShadowDto(
      color: other.color ?? color,
      offset: other.offset ?? offset,
      blurRadius: other.blurRadius ?? blurRadius,
      spreadRadius: other.spreadRadius ?? spreadRadius,
    );
  }

  @override
  get props => [...super.props, spreadRadius];
}

@immutable
class ShadowAttribute
    extends ResolvableAttribute<ShadowAttribute, ShadowDto, Shadow> {
  const ShadowAttribute(ShadowDto value) : super(value);

  @override
  final create = ShadowAttribute.new;
}

@immutable
class BoxShadowAttribute
    extends ResolvableAttribute<BoxShadowAttribute, BoxShadowDto, BoxShadow> {
  const BoxShadowAttribute(BoxShadowDto value) : super(value);

  @override
  final create = BoxShadowAttribute.new;
}
