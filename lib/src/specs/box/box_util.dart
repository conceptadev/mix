import 'package:flutter/material.dart';

import '../../attributes/constraints/constraints_dto.dart';
import '../../attributes/constraints/constraints_util.dart';
import '../../attributes/decoration/decoration_dto.dart';
import '../../attributes/decoration/decoration_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/spacing/spacing_dto.dart';
import '../../attributes/spacing/spacing_util.dart';
import '../../core/attribute.dart';
import 'box_attribute.dart';

class BoxSpecUtility<T extends Attribute>
    extends SpecUtility<T, BoxSpecAttribute> {
  late final decoration = BoxDecorationUtility((v) => only(decoration: v));
  late final foregroundDecoration =
      BoxDecorationUtility((v) => only(foregroundDecoration: v));
  late final alignment = AlignmentUtility((v) => only(alignment: v));
  late final padding = SpacingUtility((v) => only(padding: v));
  late final margin = SpacingUtility((v) => only(margin: v));
  late final color = decoration.color;
  late final elevation = decoration.elevation;
  late final gradient = decoration.gradient;
  late final radialGradient = gradient.radial;
  late final linearGradient = gradient.linear;
  late final shapeDecoration =
      ShapeDecorationUtility((v) => only(decoration: v));
  late final constraints = BoxConstraintsUtility((v) => only(constraints: v));
  late final transform = Matrix4Utility((v) => only(transform: v));
  late final transformAlignment = AlignmentUtility((v) => only(alignment: v));
  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));
  late final borderRadius = decoration.borderRadius;
  late final borderRadiusDirectional = decoration.borderRadiusDirectional;
  late final border = decoration.border;
  late final borderDirectional = decoration.borderDirectional;
  late final shadows = decoration.boxShadows;
  late final shadow = decoration.boxShadow;
  late final maxWidth = constraints.maxWidth;
  late final minWidth = constraints.minWidth;
  late final maxHeight = constraints.maxHeight;
  late final minHeight = constraints.minHeight;
  late final width = DoubleUtility((v) => only(width: v));
  late final height = DoubleUtility((v) => only(height: v));

  BoxSpecUtility(super.builder);

  // @override
  // BoxSpecUtility<VariantAttribute> call(Variant variant) {
  //   return BoxSpecUtility((v) => VariantAttribute(variant, Style(v)));
  // }

  @override
  T only({
    AlignmentGeometry? alignment,
    SpacingDto? padding,
    SpacingDto? margin,
    DecorationDto? decoration,
    DecorationDto? foregroundDecoration,
    BoxConstraintsDto? constraints,
    double? width,
    double? height,
    Matrix4? transform,
    Clip? clipBehavior,
  }) {
    return builder(
      BoxSpecAttribute(
        alignment: alignment,
        padding: padding,
        margin: margin,
        constraints: constraints,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        transform: transform,
        clipBehavior: clipBehavior,
        width: width,
        height: height,
      ),
    );
  }
}
