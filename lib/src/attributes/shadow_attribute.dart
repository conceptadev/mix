import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/mix_provider_data.dart';
import 'color_attribute.dart';

@immutable
abstract class ShadowAttributeImpl<Value extends Shadow>
    extends ResolvableAttribute<Value> {
  final ColorAttribute? color;
  final Offset? offset;
  final double? blurRadius;

  const ShadowAttributeImpl({this.blurRadius, this.color, this.offset});

  @override
  Value resolve(MixData mix);

  @override
  ShadowAttributeImpl<Value> merge(covariant ShadowAttributeImpl<Value>? other);
}

@immutable
class ShadowAttribute extends ShadowAttributeImpl<Shadow> {
  const ShadowAttribute({super.blurRadius, super.color, super.offset});

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
  ShadowAttribute merge(covariant ShadowAttribute? other) {
    if (other == null) return this;

    return ShadowAttribute(
      blurRadius: other.blurRadius ?? blurRadius,
      color: other.color ?? color,
      offset: other.offset ?? offset,
    );
  }

  @override
  get props => [color, offset, blurRadius];
}

class BoxShadowAttribute extends ShadowAttributeImpl<BoxShadow> {
  final double? spreadRadius;

  const BoxShadowAttribute({
    super.color,
    super.offset,
    super.blurRadius,
    this.spreadRadius,
  });

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
  BoxShadowAttribute merge(BoxShadowAttribute? other) {
    if (other == null) return this;

    return BoxShadowAttribute(
      color: other.color ?? color,
      offset: other.offset ?? offset,
      blurRadius: other.blurRadius ?? blurRadius,
      spreadRadius: other.spreadRadius ?? spreadRadius,
    );
  }

  @override
  get props => [color, offset, blurRadius, spreadRadius];
}
