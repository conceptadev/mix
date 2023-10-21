// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/rendering.dart';

import '../core/dto/color.dto.dart';
import '../factory/mix_provider_data.dart';
import 'border_radius_geometry.attribute.dart';
import 'box_border.attribute.dart';
import 'box_shadow.attribute.dart';
import 'gradient.attribute.dart';
import 'style_attribute.dart';

abstract class DecorationAttribute<T extends Decoration>
    extends StyleAttribute<T> {
  const DecorationAttribute();

  static DecorationAttribute from(Decoration decoration) {
    if (decoration is BoxDecoration) {
      return BoxDecorationAttribute.from(decoration);
    } else if (decoration is ShapeDecoration) {
      return ShapeDecorationAttribute.from(decoration);
    }
    throw UnimplementedError();
  }

  @override
  DecorationAttribute<T> merge(covariant DecorationAttribute<T>? other);
}

class BoxDecorationAttribute extends DecorationAttribute<BoxDecoration> {
  final ColorDto? color;
  final BoxBorderAttribute? border;
  final BorderRadiusGeometryAttribute? borderRadius;
  final GradientAttribute? gradient;
  final List<BoxShadowAttribute>? boxShadow;
  final BoxShape? shape;

  const BoxDecorationAttribute({
    this.border,
    this.borderRadius,
    this.gradient,
    this.boxShadow,
    this.color,
    this.shape,
  });

  factory BoxDecorationAttribute.from(BoxDecoration decoration) {
    final gradient = decoration.gradient;
    final borderRadius = decoration.borderRadius;
    final border = decoration.border;
    final boxShadow = decoration.boxShadow;

    return BoxDecorationAttribute(
      border: border == null ? null : BoxBorderAttribute.from(border),
      borderRadius: borderRadius == null
          ? null
          : BorderRadiusGeometryAttribute.from(borderRadius),
      gradient: gradient == null ? null : GradientAttribute(gradient),
      boxShadow: boxShadow?.map(BoxShadowAttribute.fromBoxShadow).toList(),
      color: ColorDto.maybeFrom(decoration.color),
      shape: decoration.shape,
    );
  }

  @override
  BoxDecorationAttribute merge(BoxDecorationAttribute? other) {
    if (other == null) return this;

    return BoxDecorationAttribute(
      border: border?.merge(other.border) ?? other.border,
      borderRadius:
          borderRadius?.merge(other.borderRadius) ?? other.borderRadius,
      gradient: gradient?.merge(other.gradient) ?? other.gradient,
      boxShadow: mergeAttrList(boxShadow, other.boxShadow),
      color: color?.merge(other.color) ?? other.color,
      shape: other.shape ?? shape,
    );
  }

  @override
  BoxDecoration resolve(MixData mix) {
    return BoxDecoration(
      color: resolveDto(color, mix),
      border: resolveAttr(border, mix),
      borderRadius: resolveAttr(borderRadius, mix),
      boxShadow: boxShadow?.map((e) => e.resolve(mix)).toList(),
      gradient: resolveAttr(gradient, mix),
    );
  }

  @override
  get props => [border, borderRadius, gradient, boxShadow, color, shape];
}

class ShapeDecorationAttribute extends DecorationAttribute<ShapeDecoration> {
  // The color to fill in the background of the shape.
  final ColorDto? color;

  // The shape of the box.
  final ShapeBorder? shape;
  // A gradient to use when filling the box.
  final GradientAttribute? gradient;

  // Shadows cast by this box behind the box.
  final List<BoxShadowAttribute>? boxShadow;

  const ShapeDecorationAttribute({
    this.color,
    this.shape,
    this.gradient,
    this.boxShadow,
  });

  factory ShapeDecorationAttribute.from(ShapeDecoration decoration) {
    final gradient = decoration.gradient;
    final shape = decoration.shape;
    final boxShadow = decoration.shadows;

    return ShapeDecorationAttribute(
      color: ColorDto.maybeFrom(decoration.color),
      shape: shape,
      gradient: gradient == null ? null : GradientAttribute(gradient),
      boxShadow: boxShadow?.map(BoxShadowAttribute.fromBoxShadow).toList(),
    );
  }

  @override
  ShapeDecorationAttribute merge(ShapeDecorationAttribute? other) {
    if (other == null) return this;

    return ShapeDecorationAttribute(
      color: color?.merge(other.color) ?? other.color,
      shape: other.shape ?? shape,
      gradient: mergeAttr(gradient, other.gradient),
      boxShadow: mergeAttrList(boxShadow, other.boxShadow),
    );
  }

  @override
  ShapeDecoration resolve(MixData mix) {
    return ShapeDecoration(
      color: color?.resolve(mix),
      gradient: resolveAttr(gradient, mix),
      shadows: boxShadow?.map((e) => e.resolve(mix)).toList(),
      shape: shape ?? const RoundedRectangleBorder(),
    );
  }

  @override
  List<Object?> get props => [color, shape, gradient, boxShadow];
}
