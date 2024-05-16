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

/// Provides utility methods for configuring [BoxSpecAttribute]s.
///
/// Use this class to define reusable styling and layout configurations
/// for [BoxSpec]s.
class BoxSpecUtility<T extends Attribute>
    extends SpecUtility<T, BoxSpecAttribute> {
  /// Utilities for configuring the [BoxSpecAttribute.decoration].
  late final decoration = BoxDecorationUtility((v) => only(decoration: v));

  /// Utilities for configuring the [BoxSpecAttribute.foregroundDecoration].
  late final foregroundDecoration =
      BoxDecorationUtility((v) => only(foregroundDecoration: v));

  /// Utilities for configuring the [BoxSpecAttribute.alignment].
  late final alignment = AlignmentUtility((v) => only(alignment: v));

  /// Utilities for configuring the [BoxSpecAttribute.padding].
  late final padding = SpacingUtility((v) => only(padding: v));

  /// Utilities for configuring the [BoxSpecAttribute.margin].
  late final margin = SpacingUtility((v) => only(margin: v));

  /// Utilities for configuring the [BoxSpecAttribute.constraints].
  late final constraints = BoxConstraintsUtility((v) => only(constraints: v));

  /// Utilities for configuring the [BoxSpecAttribute.transform].
  late final transform = Matrix4Utility((v) => only(transform: v));

  /// Utilities for configuring the [BoxSpecAttribute.transformAlignment].
  late final transformAlignment = AlignmentUtility((v) => only(alignment: v));

  /// Utilities for configuring the [BoxSpecAttribute.clipBehavior].
  late final clipBehavior = ClipUtility((v) => only(clipBehavior: v));

  /// Utilities for configuring the [BoxSpecAttribute.width].
  late final width = DoubleUtility((v) => only(width: v));

  /// Utilities for configuring the [BoxSpecAttribute.height].
  late final height = DoubleUtility((v) => only(height: v));

  /// Utilities for configuring various properties of the [BoxSpecAttribute.decoration].
  late final color = decoration.color;
  late final elevation = decoration.elevation;
  late final gradient = decoration.gradient;
  late final radialGradient = gradient.radial;
  late final linearGradient = gradient.linear;
  late final shapeDecoration =
      ShapeDecorationUtility((v) => only(decoration: v));
  late final borderRadius = decoration.borderRadius;
  late final borderRadiusDirectional = decoration.borderRadiusDirectional;
  late final border = decoration.border;
  late final borderDirectional = decoration.borderDirectional;
  late final shadows = decoration.boxShadows;
  late final shadow = decoration.boxShadow;

  /// Utilities for configuring various properties of the [BoxSpecAttribute.constraints].
  late final maxWidth = constraints.maxWidth;
  late final minWidth = constraints.minWidth;
  late final maxHeight = constraints.maxHeight;
  late final minHeight = constraints.minHeight;

  /// Creates a new [BoxSpecUtility] with the given [builder].
  BoxSpecUtility(super.builder);

  /// Returns a new [BoxSpecAttribute] with the specified properties.
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
