// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
//
// DO NOT MODIFY

// ignore_for_file: prefer_relative_imports
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

import 'box.spec.g.dart';

/// Represents the attributes of a [BoxTestSpec].
///
/// This class encapsulates properties defining the layout and
/// appearance of a [BoxTestSpec].
///
/// Use this class to configure the attributes of a [BoxTestSpec] and pass it to
/// the [BoxTestSpec] constructor.
class BoxTestSpecAttribute extends SpecAttribute<BoxTestSpec> {
  const BoxTestSpecAttribute({
    this.alignment,
    this.padding,
    this.margin,
    this.constraints,
    this.decoration,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
    this.clipBehavior,
    this.width,
    this.height,
    super.animated,
  });

  /// Aligns the child within the box.
  final AlignmentGeometry? alignment;

  /// Adds empty space inside the box.
  final SpacingDto? padding;

  /// Adds empty space around the box.
  final SpacingDto? margin;

  /// Applies additional constraints to the child.
  final BoxConstraintsDto? constraints;

  /// Paints a decoration behind the child.
  final DecorationDto? decoration;

  /// Paints a decoration in front of the child.
  final DecorationDto? foregroundDecoration;

  /// Applies a transformation matrix before painting the box.
  final Matrix4? transform;

  /// Aligns the origin of the coordinate system for the [transform].
  final AlignmentGeometry? transformAlignment;

  /// Defines the clip behavior for the box when [BoxConstraints] has a negative
  /// minimum extent.
  final Clip? clipBehavior;

  /// Specifies the width of the box.
  final double? width;

  /// Specifies the height of the box.
  final double? height;

  @override
  BoxTestSpec resolve(MixData mix) {
    return BoxTestSpec(
      alignment: alignment,
      padding: padding?.resolve(mix),
      margin: margin?.resolve(mix),
      constraints: constraints?.resolve(mix),
      decoration: decoration?.resolve(mix),
      foregroundDecoration: foregroundDecoration?.resolve(mix),
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      width: width,
      height: height,
    );
  }

  @override
  BoxTestSpecAttribute merge(BoxTestSpecAttribute? other) {
    if (other == null) return this;

    return BoxTestSpecAttribute(
      alignment: other.alignment ?? alignment,
      padding: padding?.merge(other.padding) ?? other.padding,
      margin: margin?.merge(other.margin) ?? other.margin,
      constraints: constraints?.merge(other.constraints) ?? other.constraints,
      decoration: decoration?.merge(other.decoration) ?? other.decoration,
      foregroundDecoration:
          foregroundDecoration?.merge(other.foregroundDecoration) ??
              other.foregroundDecoration,
      transform: other.transform ?? transform,
      transformAlignment: other.transformAlignment ?? transformAlignment,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      width: other.width ?? width,
      height: other.height ?? height,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoxTestSpecAttribute &&
        other.alignment == alignment &&
        other.padding == padding &&
        other.margin == margin &&
        other.constraints == constraints &&
        other.decoration == decoration &&
        other.foregroundDecoration == foregroundDecoration &&
        other.transform == transform &&
        other.transformAlignment == transformAlignment &&
        other.clipBehavior == clipBehavior &&
        other.width == width &&
        other.height == height;
  }

  @override
  int get hashCode {
    return alignment.hashCode ^
        padding.hashCode ^
        margin.hashCode ^
        constraints.hashCode ^
        decoration.hashCode ^
        foregroundDecoration.hashCode ^
        transform.hashCode ^
        transformAlignment.hashCode ^
        clipBehavior.hashCode ^
        width.hashCode ^
        height.hashCode;
  }
}
