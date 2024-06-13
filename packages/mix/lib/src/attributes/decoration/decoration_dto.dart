// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/dto.dart';
import '../../core/mix_data.dart';
import '../../internal/iterable_ext.dart';
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
/// This class needs to have the different properties that are not found in the [Modifiers] class.
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

  DecorationDto mergeDecoration(covariant DecorationDto? other);

  @override
  @nonVirtual
  DecorationDto merge(DecorationDto? other) {
    if (other == null) return this;

    if (runtimeType == other.runtimeType) {
      return mergeDecoration(other);
    }
    if (other is BoxDecorationDto) {
      // Recursive call
      return _toBoxDecorationDto(this as ShapeDecorationDto).merge(other);
    }

    if (other is ShapeDecorationDto) {
      // Recursive call
      return _toShapeDecorationDto(this as BoxDecorationDto).merge(other);
    }

    throw UnimplementedError('Merging of $this and $other is not supported.');
  }
}

/// Represents a Data transfer object of [BoxDecoration]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[BoxDecoration]
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

  @override
  BoxDecorationDto mergeDecoration(BoxDecorationDto? other) {
    return BoxDecorationDto(
      color: color?.merge(other?.color) ?? other?.color,
      border: border?.merge(other?.border) ?? other?.border,
      borderRadius:
          borderRadius?.merge(other?.borderRadius) ?? other?.borderRadius,
      gradient: gradient?.tryToMerge(other?.gradient) ?? other?.gradient,
      boxShadow: boxShadow?.merge(other?.boxShadow) ?? other?.boxShadow,
      shape: other?.shape ?? shape,
      backgroundBlendMode: other?.backgroundBlendMode ?? backgroundBlendMode,
      image: image?.merge(other?.image) ?? other?.image,
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
  ShapeDecorationDto mergeDecoration(ShapeDecorationDto? other) {
    return ShapeDecorationDto(
      color: color?.merge(other?.color) ?? other?.color,
      shape: shape?.merge(other?.shape) ?? other?.shape,
      gradient: gradient?.tryToMerge(other?.gradient) ?? other?.gradient,
      shadows: boxShadow?.merge(other?.boxShadow) ?? other?.boxShadow,
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

/// Converts a [ShapeDecorationDto] to a [BoxDecorationDto].
BoxDecorationDto _toBoxDecorationDto(ShapeDecorationDto dto) {
  BoxShape? boxShape;
  BoxBorderDto? boxBorder;
  BorderRadiusGeometryDto? borderRadius;

  final shape = dto.shape;

  if (shape is CircleBorderDto) {
    boxShape = BoxShape.circle;
    boxBorder = BoxBorderDto.fromSide(shape.side);
  } else if (shape is RoundedRectangleBorderDto) {
    boxShape = BoxShape.rectangle;
    borderRadius = shape.borderRadius;

    boxBorder = BoxBorderDto.fromSide(shape.side);
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
  ShapeBorderDto? shapeBorder;
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
      if (dto.borderRadius != null || dto.border != null) {
        shapeBorder = RoundedRectangleBorderDto(
          borderRadius: dto.borderRadius,
          side: dto.border?.top,
        );
      }
      break;
  }

  return ShapeDecorationDto(
    color: dto.color,
    shape: shapeBorder,
    gradient: dto.gradient,
    shadows: dto.boxShadow,
  );
}

extension DecorationExt on Decoration {
  DecorationDto toDto() {
    if (this is BoxDecoration) {
      return (this as BoxDecoration).toDto();
    } else if (this is ShapeDecoration) {
      return (this as ShapeDecoration).toDto();
    }
    throw Exception('Unknown decoration type: $runtimeType');
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
