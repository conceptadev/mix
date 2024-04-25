import 'package:flutter/material.dart';

import '../../attributes/constraints/constraints_dto.dart';
import '../../attributes/constraints/constraints_util.dart';
import '../../attributes/decoration/decoration_dto.dart';
import '../../attributes/decoration/decoration_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/spacing/spacing_dto.dart';
import '../../attributes/spacing/spacing_util.dart';
import '../../core/attribute.dart';
import '../../decorators/widget_decorators_util.dart';
import 'box_attribute.dart';

final box = BoxSpecUtility(selfBuilder);

final $box = box;

@Deprecated('use box.border instead')
final border = box.border;

@Deprecated('use box.borderDirectional instead')
final borderDirectional = box.borderDirectional;

@Deprecated('use box.borderRadius instead')
final borderRadius = box.borderRadius;

@Deprecated('use box.borderRadiusDirectional instead')
final borderRadiusDirectional = box.borderRadiusDirectional;

@Deprecated('use box.color instead')
final backgroundColor = box.color;

@Deprecated('use box.width instead')
final width = box.width;

@Deprecated('use box.height instead')
final height = box.height;

@Deprecated('use box.minHeight instead')
final minHeight = box.minHeight;

@Deprecated('use box.maxHeight instead')
final maxHeight = box.maxHeight;

@Deprecated('use box.minWidth instead')
final minWidth = box.minWidth;

@Deprecated('use box.maxWidth instead')
final maxWidth = box.maxWidth;

@Deprecated('use box.padding instead')
final padding = box.padding;

@Deprecated('use box.margin instead')
final margin = box.margin;

@Deprecated('use box.alignment instead')
final alignment = box.alignment;

@Deprecated('use box.clipBehavior instead')
final clipBehavior = box.clipBehavior;

@Deprecated('use box.elevation instead')
final elevation = box.elevation;

@Deprecated('use box.radialGradient instead')
final radialGradient = box.radialGradient;

@Deprecated('use box.linearGradient instead')
final linearGradient = box.linearGradient;

class BoxSpecUtility<T extends SpecAttribute>
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
