// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../../core/dto.dart';
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
@immutable
abstract class DecorationDto<Value extends Decoration> extends Dto<Value> {
  final ColorDto? color;
  final GradientDto? gradient;
  final List<BoxShadowDto>? boxShadow;

  const DecorationDto({
    required this.color,
    required this.gradient,
    required this.boxShadow,
  });

  @override
  DecorationDto<Value> merge(covariant DecorationDto<Value>? other);
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
      shape: other.shape ?? shape,
      backgroundBlendMode: other.backgroundBlendMode ?? backgroundBlendMode,
      image: image?.merge(other.image) ?? other.image,
    );
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

  List<BoxShadowDto>? get shadows => boxShadow;

  @override
  ShapeDecorationDto merge(ShapeDecorationDto? other) {
    if (other == null) return this;

    final shapeStrategy = ShapeBorderMergeDtoStrategy(shape, other.shape);

    return ShapeDecorationDto(
      color: color?.merge(other.color) ?? other.color,
      shape: shapeStrategy.merge(),
      gradient: gradient?.merge(other.gradient) ?? other.gradient,
      shadows: boxShadow?.merge(other.boxShadow) ?? other.boxShadow,
    );
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

/// Merges [DecorationDto] instances based on their runtime types.
class DecorationMergeDtoStrategy extends DtoMergeStrategy<DecorationDto> {
  /// Creates a new instance with the given [a] and [b].
  const DecorationMergeDtoStrategy(super.a, super.b);

  /// Converts a [ShapeDecorationDto] to a [BoxDecorationDto].
  BoxDecorationDto _toBoxDecorationDto(ShapeDecorationDto dto) {
    BoxShape? boxShape;
    BoxBorderDto? boxBorder;
    BorderRadiusGeometryDto? borderRadius;

    if (dto.shape is CircleBorderDto) {
      boxShape = BoxShape.circle;
      boxBorder = BoxBorderDto.fromSide((dto.shape as CircleBorderDto).side);
    } else if (dto.shape is RoundedRectangleBorderDto) {
      boxShape = BoxShape.rectangle;
      borderRadius = (dto.shape as RoundedRectangleBorderDto).borderRadius;

      boxBorder =
          BoxBorderDto.fromSide((dto.shape as RoundedRectangleBorderDto).side);
    } else {
      // BeveledRectangleBorder cannot be accurately represented as a BoxDecoration
      // Return the original ShapeDecorationDto
      boxShape = null;
      boxBorder = null;
      borderRadius = null;
    }

    return BoxDecorationDto(
      color: dto.color,
      border: boxBorder,
      borderRadius: borderRadius,
      gradient: dto.gradient,
      boxShadow: dto.boxShadow,
      shape: boxShape,
    );
  }

  /// Converts a [BoxDecorationDto] to a [ShapeDecorationDto].
  ShapeDecorationDto _toShapeDecorationDto(BoxDecorationDto dto) {
    final ShapeBorderDto? shapeBorder;
    assert(
      dto.border == null || dto.border!.isUniform,
      'Border to use with ShapeDecoration must be uniform.',
    );
    switch (dto.shape) {
      case BoxShape.circle:
        if (dto.border != null) {
          shapeBorder = CircleBorderDto(side: dto.border!.top);
        } else {
          shapeBorder = const CircleBorderDto();
        }
        break;
      case BoxShape.rectangle:
        shapeBorder = RoundedRectangleBorderDto(
          borderRadius: dto.borderRadius,
          side: dto.border?.top,
        );

        break;
      default:
        shapeBorder = null;
    }

    return ShapeDecorationDto(
      color: dto.color,
      shape: shapeBorder,
      gradient: dto.gradient,
      shadows: dto.boxShadow,
    );
  }

  /// Merges two [BoxDecorationDto] instances.
  BoxDecorationDto _mergeBoxDecoration(
    BoxDecorationDto a,
    BoxDecorationDto b,
  ) {
    return BoxDecorationDto(
      color: a.color?.merge(b.color) ?? b.color,
      border: a.border?.merge(b.border) ?? b.border,
      borderRadius: a.borderRadius?.merge(b.borderRadius) ?? b.borderRadius,
      gradient: a.gradient?.merge(b.gradient) ?? b.gradient,
      boxShadow: a.boxShadow?.merge(b.boxShadow) ?? b.boxShadow,
      shape: b.shape ?? a.shape,
      backgroundBlendMode: b.backgroundBlendMode ?? a.backgroundBlendMode,
      image: a.image?.merge(b.image) ?? b.image,
    );
  }

  /// Merges two [ShapeDecorationDto] instances.
  ShapeDecorationDto _mergeShapeDecoration(
    ShapeDecorationDto a,
    ShapeDecorationDto b,
  ) {
    return ShapeDecorationDto(
      color: a.color?.merge(b.color) ?? b.color,
      shape: a.shape?.merge(b.shape) ?? b.shape,
      gradient: a.gradient?.merge(b.gradient) ?? b.gradient,
      shadows: a.boxShadow?.merge(b.boxShadow) ?? b.boxShadow,
    );
  }

  /// Merges two [DecorationDto] instances.
  ///
  /// If both [a] and [b] are [BoxDecorationDto], merges them using [_mergeBoxDecoration].
  /// If both [a] and [b] are [ShapeDecorationDto], merges them using [_mergeShapeDecoration].
  /// If [a] is [ShapeDecorationDto] and [b] is [BoxDecorationDto], converts [a] to [BoxDecorationDto] and merges them.
  /// If [a] is [BoxDecorationDto] and [b] is [ShapeDecorationDto], converts [a] to [ShapeDecorationDto] and merges them.
  ///
  /// If [a] and [b] have incompatible types, throws a [MergeStrategyException].
  @override
  DecorationDto mergeStrategy(DecorationDto a, DecorationDto b) {
    if (a is BoxDecorationDto && b is BoxDecorationDto) {
      return _mergeBoxDecoration(a, b);
    } else if (a is ShapeDecorationDto && b is ShapeDecorationDto) {
      return _mergeShapeDecoration(a, b);
    } else if (a is ShapeDecorationDto && b is BoxDecorationDto) {
      return _mergeBoxDecoration(_toBoxDecorationDto(a), b);
    } else if (a is BoxDecorationDto && b is ShapeDecorationDto) {
      return _mergeShapeDecoration(_toShapeDecorationDto(a), b);
    }

    throw MergeStrategyException(a, b);
  }
}

extension BoxDecorationExt on BoxDecoration {
  BoxDecorationDto toDto() {
    return BoxDecorationDto(
      color: color?.toDto(),
      border: border?.toDto(),
      borderRadius: borderRadius?.toDto(),
      gradient: gradient?.toDto(),
      boxShadow: boxShadow?.map((e) => e.toDto()).toList(),
      shape: shape,
      backgroundBlendMode: backgroundBlendMode,
      image: image?.toDto(),
    );
  }
}

extension ShapeDecorationExt on ShapeDecoration {
  ShapeDecorationDto toDto() {
    return ShapeDecorationDto(
      color: color?.toDto(),
      shape: shape.toDto(),
      gradient: gradient?.toDto(),
      shadows: shadows?.map((e) => e.toDto()).toList(),
    );
  }
}
