// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/iterable_ext.dart';
import '../../factory/mix_provider_data.dart';
import '../border/border_dto.dart';
import '../border/border_radius_dto.dart';
import '../border/shape_border_dto.dart';
import '../color/color_dto.dart';
import '../gradient/gradient_dto.dart';
import '../shadow/shadow_dto.dart';
import 'image/decoration_image_dto.dart';

/// A Data transfer object that represents a [Decoration] value.
///
/// This DTO is used to resolve a [Decoration] value from a [MixData] instance.
///
/// This class needs to have the different properties that are not found in the [Decorators] class.
/// In order to support merging of [Decoration] values, and reusable of common properties.
///
/// See also:
/// * [Decoration], which is the Flutter equivalent class.
/// * [BoxDecoration], which is the Flutter equivalent class.
/// * [ShapeDecoration], which is the Flutter equivalent class.
///
/// {@category DTO}
@immutable
abstract class DecorationDto<Value extends Decoration> extends Dto<Value>
    with Mergeable<DecorationDto> {
  final ColorDto? color;
  final GradientDto? gradient;
  final List<BoxShadowDto>? boxShadow;

  const DecorationDto({
    required this.color,
    required this.gradient,
    required this.boxShadow,
  });

  static DecorationDto<T> from<T extends Decoration>(T decoration) {
    if (decoration is BoxDecoration) {
      return BoxDecorationDto.from(decoration) as DecorationDto<T>;
    } else if (decoration is ShapeDecoration) {
      return ShapeDecorationDto.from(decoration) as DecorationDto<T>;
    }
    throw ArgumentError.value(
      decoration,
      'decoration',
      'Unsupported decoration type',
    );
  }

  DecorationDto<Value> _mergeDecoration(covariant DecorationDto<Value>? other);

  /// Returns true if this decoration is mergeable with other.
  bool isMergeable();

  @override
  DecorationDto merge(covariant DecorationDto? other) {
    if (other == null) return this;

    if (runtimeType == other.runtimeType) {
      return _mergeDecoration(other as DecorationDto<Value>);
    }

    assert(isMergeable(), 'This decoration is not mergeable with other');

    if (other is BoxDecorationDto) {
      return BoxDecorationDto(
        color: color,
        gradient: gradient,
        boxShadow: boxShadow,
      )._mergeDecoration(other);
    } else if (other is ShapeDecorationDto) {
      return ShapeDecorationDto(
        color: color,
        gradient: gradient,
        shadows: boxShadow,
      )._mergeDecoration(other);
    }

    throw ArgumentError.value(other, 'other', 'Unsupported decoration type');
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
  final BoxBorderDto? border;
  final BorderRadiusGeometryDto? borderRadius;
  final BoxShape? shape;
  final BlendMode? backgroundBlendMode;
  final DecorationImageDto? image;

  const BoxDecorationDto({
    super.color,
    this.border,
    this.borderRadius,
    super.gradient,
    super.boxShadow,
    this.shape,
    this.backgroundBlendMode,
    this.image,
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
      backgroundBlendMode: decoration.backgroundBlendMode,
      image: DecorationImageDto.maybeFrom(decoration.image),
    );
  }

  /// Creates a [BoxDecorationDto] from a given [BoxDecoration].
  ///
  /// Returns null if the decoration is null.
  static BoxDecorationDto? maybeFrom(BoxDecoration? decoration) {
    return decoration == null ? null : from(decoration);
  }

  /// Merges this [BoxDecorationDto] with `other` [BoxDecorationDto]
  @override
  BoxDecorationDto _mergeDecoration(BoxDecorationDto? other) {
    if (other == null) return this;

    return BoxDecorationDto(
      color: color?.merge(other.color) ?? other.color,
      border: border?.merge(other.border) ?? other.border,
      borderRadius:
          borderRadius?.merge(other.borderRadius) ?? other.borderRadius,
      gradient: gradient?.merge(other.gradient) ?? other.gradient,
      boxShadow: boxShadow?.merge(other.boxShadow) ?? other.boxShadow,
      shape: other.shape ?? shape,
      backgroundBlendMode: other.backgroundBlendMode ?? backgroundBlendMode,
      image: image?.merge(other.image) ?? other.image,
    );
  }

  @override
  bool isMergeable() {
    // is only mergeable if no other properties are set besides: color, boxShadow, and gradient
    return border == null &&
        borderRadius == null &&
        shape == null &&
        backgroundBlendMode == null;
  }

  /// Resolves this [BoxDecorationDto] with a given [MixData] to a [BoxDecoration]
  @override
  BoxDecoration resolve(MixData mix) {
    return BoxDecoration(
      color: color?.resolve(mix),
      image: image?.resolve(mix),
      border: border?.resolve(mix),
      borderRadius: borderRadius?.resolve(mix),
      boxShadow: boxShadow?.map((e) => e.resolve(mix)).toList(),
      gradient: gradient?.resolve(mix),
      backgroundBlendMode: backgroundBlendMode,
      shape: shape ?? BoxShape.rectangle,
    );
  }

  @override
  List<Object?> get props => [
        color,
        border,
        borderRadius,
        gradient,
        boxShadow,
        shape,
        backgroundBlendMode,
      ];
}

@immutable
class ShapeDecorationDto extends DecorationDto<ShapeDecoration> {
  final ShapeBorderDto? shape;

  const ShapeDecorationDto({
    super.color,
    this.shape,
    super.gradient,
    List<BoxShadowDto>? shadows,
  }) : super(boxShadow: shadows);

  static ShapeDecorationDto from(ShapeDecoration decoration) {
    return ShapeDecorationDto(
      color: ColorDto.maybeFrom(decoration.color),
      shape: ShapeBorderDto.maybeFrom(decoration.shape),
      gradient: GradientDto.maybeFrom(decoration.gradient),
      shadows: decoration.shadows?.map(BoxShadowDto.from).toList(),
    );
  }

  static ShapeDecorationDto? maybeFrom(ShapeDecoration? decoration) {
    return decoration == null ? null : from(decoration);
  }

  @override
  ShapeDecorationDto _mergeDecoration(ShapeDecorationDto? other) {
    if (other == null) return this;

    return ShapeDecorationDto(
      color: color?.merge(other.color) ?? other.color,
      shape: shape?.merge(other.shape) ?? other.shape,
      gradient: gradient?.merge(other.gradient) ?? other.gradient,
      shadows: boxShadow?.merge(other.boxShadow) ?? other.boxShadow,
    );
  }

  List<BoxShadowDto>? get shadows => boxShadow;

  @override
  bool isMergeable() {
    // is only mergeable if no other properties are set besides: color, boxShadow, and gradient
    return shape == null;
  }

  @override
  ShapeDecoration resolve(MixData mix) {
    return ShapeDecoration(
      color: color?.resolve(mix),
      gradient: gradient?.resolve(mix),
      shadows: shadows?.map((e) => e.resolve(mix)).toList(),
      shape: shape?.resolve(mix) ?? const RoundedRectangleBorder(),
    );
  }

  @override
  List<Object?> get props => [color, shape, gradient, shadows];
}
