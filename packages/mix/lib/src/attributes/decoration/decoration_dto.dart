// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports

import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'decoration_dto.g.dart';

/// A Data transfer object that represents a [Decoration] value.
///
/// This DTO is used to resolve a [Decoration] value from a [MixData] instance.
///
/// This class needs to have the different properties that are not found in the [Modifiers] class.
/// In order to support merging of [Decoration] values, and reusable of common properties.
@immutable
sealed class DecorationDto<T extends Decoration> extends Dto<T> {
  final ColorDto? color;
  final GradientDto? gradient;
  @MixableProperty(
    utilities: [
      MixableUtility(
        alias: 'boxShadows',
        properties: [(path: 'add', alias: 'boxShadow')],
      ),
      MixableUtility(alias: 'elevation', type: 'ElevationUtility'),
    ],
  )
  final List<BoxShadowDto>? boxShadow;

  const DecorationDto({
    required this.color,
    required this.gradient,
    required this.boxShadow,
  });

  static DecorationDto? tryToMerge(DecorationDto? a, DecorationDto? b) {
    if (b == null) return a;
    if (a == null) return b;

    if (a.runtimeType == b.runtimeType) {
      return a.merge(b);
    }
    if (b is BoxDecorationDto) {
      // Recursive call
      return _toBoxDecorationDto(a as ShapeDecorationDto).merge(b);
    }

    if (b is ShapeDecorationDto) {
      // Recursive call
      return _toShapeDecorationDto(a as BoxDecorationDto).merge(b);
    }

    throw UnimplementedError('Merging of $a and $b is not supported.');
  }

  @override
  DecorationDto<T> merge(covariant DecorationDto<T>? other);
}

/// Represents a Data transfer object of [BoxDecoration]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[BoxDecoration]
@MixableDto()
final class BoxDecorationDto extends DecorationDto<BoxDecoration>
    with _$BoxDecorationDto {
  @MixableProperty(
    utilities: [
      MixableUtility(
        properties: [(path: 'directional', alias: 'borderDirectional')],
      ),
    ],
  )
  final BoxBorderDto? border;

  @MixableProperty(
    utilities: [
      MixableUtility(
        properties: [(path: 'directional', alias: 'borderRadiusDirectional')],
      ),
    ],
  )
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
  BoxDecoration get defaultValue => const BoxDecoration();
}

@MixableDto()
final class ShapeDecorationDto extends DecorationDto<ShapeDecoration>
    with _$ShapeDecorationDto {
  final ShapeBorderDto? shape;

  const ShapeDecorationDto({
    super.color,
    this.shape,
    super.gradient,
    List<BoxShadowDto>? shadows,
  }) : super(boxShadow: shadows);

  List<BoxShadowDto>? get shadows => boxShadow;
  @override
  ShapeDecoration get defaultValue =>
      const ShapeDecoration(shape: RoundedRectangleBorder());
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

extension DecorationMixExt on Decoration {
  DecorationDto toDto() {
    if (this is BoxDecoration) {
      return (this as BoxDecoration).toDto();
    } else if (this is ShapeDecoration) {
      return (this as ShapeDecoration).toDto();
    }
    throw Exception('Unknown decoration type: $runtimeType');
  }
}
