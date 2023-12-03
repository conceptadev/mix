// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import 'decoration_dto.dart';

@immutable
class DecorationAttribute
    extends DtoAttribute<DecorationAttribute, DecorationDto, Decoration>
    with SingleChildRenderAttributeMixin<DecoratedBox> {
  const DecorationAttribute(super.value);

  @override
  DecorationAttribute merge(covariant DecorationAttribute? other) {
    if (other == null) return this;

    if (value.runtimeType != other.value.runtimeType) return other;

    return DecorationAttribute(value.merge(other.value));
  }

  @override
  DecoratedBox build(mix, child) {
    return DecoratedBox(decoration: resolve(mix), child: child);
  }
}

// @immutable
// class BoxDecorationAttribute extends DecorationAttribute<BoxDecorationAttribute,
//     BoxDecorationDto, BoxDecoration> {
//   const BoxDecorationAttribute(super.value);

//   factory BoxDecorationAttribute.only({
//     ColorDto? color,
//     GradientDto? gradient,
//     BoxShape? shape,
//     BorderRadiusGeometryDto? borderRadius,
//     List<BoxShadowDto>? boxShadow,
//     BoxBorderDto? border,
//   }) {
//     return BoxDecorationAttribute(
//       BoxDecorationDto(
//         color: color,
//         border: border,
//         borderRadius: borderRadius,
//         gradient: gradient,
//         boxShadow: boxShadow,
//         shape: shape,
//       ),
//     );
//   }

//   @override
//   BoxDecorationAttribute _mergeWith(BoxDecorationAttribute other) {
//     return BoxDecorationAttribute(value.merge(other.value));
//   }
// }

// @immutable
// class ShapeDecorationAttribute extends DecorationAttribute<
//     ShapeDecorationAttribute, ShapeDecorationDto, ShapeDecoration> {
//   const ShapeDecorationAttribute(super.value);

//   factory ShapeDecorationAttribute.only({
//     ColorDto? color,
//     GradientDto? gradient,
//     ShapeBorder? shape,
//     List<BoxShadowDto>? shadows,
//   }) {
//     return ShapeDecorationAttribute(
//       ShapeDecorationDto(
//         color: color,
//         shape: shape,
//         gradient: gradient,
//         shadows: shadows,
//       ),
//     );
//   }

//   @override
//   ShapeDecorationAttribute _mergeWith(ShapeDecorationAttribute other) {
//     return ShapeDecorationAttribute(value.merge(other.value));
//   }
// }
