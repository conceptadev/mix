// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'attribute.dart';
import 'border/border_attribute.dart';
import 'border/border_radius_attribute.dart';
import 'color_attribute.dart';
import 'scalar_attribute.dart';
import 'shadow_attribute.dart';

abstract class DecorationDto<T extends Decoration> extends Dto<T> {
  const DecorationDto();
}

class BoxDecorationDto extends DecorationDto<BoxDecoration> {
  final ColorDto? color;
  final BoxBorderAttribute? border;
  final BorderRadiusGeometryAttribute? borderRadius;
  final GradientAttribute? gradient;
  final List<BoxShadowDto>? boxShadow;
  final BoxShapeAttribute? shape;

  const BoxDecorationDto({
    this.color,
    this.border,
    this.borderRadius,
    this.gradient,
    this.boxShadow,
    this.shape,
  });

  @override
  BoxDecoration resolve(MixData mix) {
    return BoxDecoration(
      color: color?.resolve(mix),
      border: border?.resolve(mix),
      borderRadius: borderRadius?.resolve(mix),
      boxShadow: boxShadow?.map((e) => e.resolve(mix)).toList(),
      gradient: gradient?.resolve(mix),
      shape: shape?.resolve(mix) ?? BoxShape.rectangle,
    );
  }

  @override
  BoxDecorationDto merge(BoxDecorationDto? other) {
    if (other == null) return this;

    return BoxDecorationDto(
      color: other.color ?? color,
      border: other.border ?? border,
      borderRadius: other.borderRadius ?? borderRadius,
      gradient: other.gradient ?? gradient,
      boxShadow: other.boxShadow ?? boxShadow,
      shape: other.shape ?? shape,
    );
  }

  @override
  List<Object?> get props =>
      [color, border, borderRadius, gradient, boxShadow, shape];
}

@immutable
abstract class DecorationAttribute<D extends DecorationDto<Value>,
    Value extends Decoration> extends ResolvableAttribute<D, Value> {
  const DecorationAttribute(super.value);
}

@immutable
class BoxDecorationAttribute
    extends DecorationAttribute<BoxDecorationDto, BoxDecoration> {
  const BoxDecorationAttribute(super.value);

  @override
  BoxDecorationAttribute merge(covariant BoxDecorationAttribute? other) {
    return other == null
        ? this
        : BoxDecorationAttribute(value.merge(other.value));
  }

  @override
  BoxDecoration resolve(MixData mix) => value.resolve(mix);
}

class ShapeDecorationDto extends DecorationDto<ShapeDecoration> {
  final ColorDto? color;
  final ShapeBorder? shape;
  final GradientAttribute? gradient;
  final List<BoxShadowDto>? boxShadow;

  const ShapeDecorationDto({
    this.color,
    this.shape,
    this.gradient,
    this.boxShadow,
  });

  @override
  ShapeDecoration resolve(MixData mix) {
    return ShapeDecoration(
      color: color?.resolve(mix),
      gradient: gradient?.resolve(mix),
      shadows: boxShadow?.map((e) => e.resolve(mix)).toList(),
      shape: shape ?? const RoundedRectangleBorder(),
    );
  }

  @override
  ShapeDecorationDto merge(ShapeDecorationDto? other) {
    if (other == null) return this;

    return ShapeDecorationDto(
      color: other.color ?? color,
      shape: other.shape ?? shape,
      gradient: other.gradient ?? gradient,
      boxShadow: other.boxShadow ?? boxShadow,
    );
  }

  @override
  List<Object?> get props => [color, shape, gradient, boxShadow];
}

@immutable
class ShapeDecorationAttribute<D extends ShapeDecorationDto>
    extends DecorationAttribute<D, ShapeDecoration> {
  const ShapeDecorationAttribute(super.value);

  @override
  ShapeDecorationAttribute merge(covariant ShapeDecorationAttribute? other) {
    return other == null
        ? this
        : ShapeDecorationAttribute(value.merge(other.value));
  }

  @override
  ShapeDecoration resolve(MixData mix) => value.resolve(mix);
}
