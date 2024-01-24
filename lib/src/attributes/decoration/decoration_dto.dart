// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/iterable_ext.dart';
import '../../factory/mix_provider_data.dart';
import '../border/border_dto.dart';
import '../border/border_radius_dto.dart';
import '../color/color_dto.dart';
import '../gradient/gradient_dto.dart';
import '../shadow/shadow_dto.dart';

/// A Data transfer object that represents a [Decoration] value.
///
/// This DTO is used to resolve a [Decoration] value from a [MixData] instance.
///
/// See also:
/// * [Decoration], which is the Flutter equivalent class.
/// * [BoxDecoration], which is the Flutter equivalent class.
/// * [ShapeDecoration], which is the Flutter equivalent class.
///
/// {@category DTO}
@immutable
abstract class DecorationDto<Value extends Decoration> extends Dto<Value>
    with Mergeable<DecorationDto<Value>> {
  const DecorationDto();

  static DecorationDto<Value> from<Value extends Decoration>(
    Decoration decoration,
  ) {
    if (decoration is BoxDecoration) {
      return BoxDecorationDto.from(decoration) as DecorationDto<Value>;
    }
    if (decoration is ShapeDecoration) {
      return ShapeDecorationDto.from(decoration) as DecorationDto<Value>;
    }

    throw UnimplementedError(
      'DecorationDto.from: $decoration is not supported',
    );
  }
}

/// Represents a Data transfer object of [BoxDecoration]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[BoxDecoration]
///
/// See also:
/// * [BoxDecoration], which is the Flutter counterpart of this class.
/// * [DecorationDto], which is the base class for this class.
/// {@category DTO}
@immutable
class BoxDecorationDto extends DecorationDto<BoxDecoration> {
  final ColorDto? color;
  final BoxBorderDto? border;
  final BorderRadiusGeometryDto? borderRadius;
  final GradientDto? gradient;
  final List<BoxShadowDto>? boxShadow;
  final BoxShape? shape;

  const BoxDecorationDto({
    this.color,
    this.border,
    this.borderRadius,
    this.gradient,
    this.boxShadow,
    this.shape,
  });

  /// Creates a [BoxDecorationDto] from a given [BoxDecoration].
  static BoxDecorationDto from(BoxDecoration decoration) {
    return BoxDecorationDto(
      color: ColorDto.maybeFrom(decoration.color),
      border: BoxBorderDto.maybeFrom(decoration.border),
      borderRadius: BorderRadiusGeometryDto.maybeFrom(decoration.borderRadius),
      gradient: GradientDto.maybeFrom(decoration.gradient),
      boxShadow: decoration.boxShadow?.map(BoxShadowDto.from).toList(),
      shape: decoration.shape,
    );
  }

  /// Creates a [BoxDecorationDto] from a given [BoxDecoration].
  ///
  /// Returns null if the decoration is null.
  static BoxDecorationDto? maybeFrom(BoxDecoration? decoration) {
    return decoration == null ? null : from(decoration);
  }

  /// Resolves this [BoxDecorationDto] with a given [MixData] to a [BoxDecoration]
  @override
  BoxDecoration resolve(MixData mix) {
    return BoxDecoration(
      color: color?.resolve(mix),
      border: border?.resolve(mix),
      borderRadius: borderRadius?.resolve(mix),
      boxShadow: boxShadow?.map((e) => e.resolve(mix)).toList(),
      gradient: gradient?.resolve(mix),
      shape: shape ?? BoxShape.rectangle,
    );
  }

  /// Merges this [BoxDecorationDto] with `other` [BoxDecorationDto]
  @override
  BoxDecorationDto merge(BoxDecorationDto? other) {
    if (other == null) return this;

    return BoxDecorationDto(
      color: color?.merge(other.color) ?? other.color,
      border: border?.merge(other.border) ?? other.border,
      borderRadius:
          borderRadius?.merge(other.borderRadius) ?? other.borderRadius,
      gradient: gradient?.merge(other.gradient) ?? other.gradient,
      boxShadow: boxShadow?.merge(other.boxShadow) ?? other.boxShadow,
    );
  }

  @override
  List<Object?> get props =>
      [color, border, borderRadius, gradient, boxShadow, shape];
}

@immutable
class ShapeDecorationDto extends DecorationDto<ShapeDecoration> {
  final ColorDto? color;
  final ShapeBorder? shape;
  final GradientDto? gradient;
  final List<BoxShadowDto>? shadows;

  const ShapeDecorationDto({
    this.color,
    this.shape,
    this.gradient,
    this.shadows,
  });

  static ShapeDecorationDto from(ShapeDecoration decoration) {
    return ShapeDecorationDto(
      color: ColorDto.maybeFrom(decoration.color),
      shape: decoration.shape,
      gradient: GradientDto.maybeFrom(decoration.gradient),
      shadows: decoration.shadows?.map(BoxShadowDto.from).toList(),
    );
  }

  static ShapeDecorationDto? maybeFrom(ShapeDecoration? decoration) {
    return decoration == null ? null : from(decoration);
  }

  @override
  ShapeDecoration resolve(MixData mix) {
    return ShapeDecoration(
      color: color?.resolve(mix),
      gradient: gradient?.resolve(mix),
      shadows: shadows?.map((e) => e.resolve(mix)).toList(),
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
      shadows: other.shadows ?? shadows,
    );
  }

  @override
  List<Object?> get props => [color, shape, gradient, shadows];
}
