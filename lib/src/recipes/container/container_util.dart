import 'package:flutter/material.dart';

import '../../attributes/border/border_radius_util.dart';
import '../../attributes/border/border_util.dart';
import '../../attributes/constraints/constraints_attribute.dart';
import '../../attributes/constraints/constraints_util.dart';
import '../../attributes/decoration/decoration_attribute.dart';
import '../../attributes/decoration/decoration_util.dart';
import '../../attributes/scalars/scalar_attribute_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/scalars/scalars_attribute.dart';
import '../../attributes/spacing/spacing_attribute.dart';
import 'container_attribute.dart';

const container = ContainerUtility.selfBuilder;
const box = ContainerUtility.selfBuilder;

const border = BoxBorderUtility.selfBuilder;
const clipBehavior = ClipBehaviorAttributeUtility.selfBuilder;

/// Predefined utility constants for creating padding attributes.
const padding = PaddingAttributeUtility.selfBuilder;

/// Predefined utility constants for creating margin attributes.
const margin = MarginAttributeUtility.selfBuilder;

// Provides an utility for creating a uniform BorderRadiusAttribute for all corners.
const borderRadius = BorderRadiusGeometryUtility.selfBuilder;
const alignment = AlignmentGeometryAttributeUtility.selfBuilder;

const boxDecoration = BoxDecorationUtility.selfBuilder;

final elevation = boxDecoration.elevation;
final boxShadow = boxDecoration.boxShadow;

const backgroundColor = BackgroundColorAttributeUtility.selfBuilder;

const boxConstraints = BoxConstraintsUtility.selfBuilder;

final minWidth = boxConstraints.minWidth;

final maxWidth = boxConstraints.maxWidth;

final minHeight = boxConstraints.minHeight;

final maxHeight = boxConstraints.maxHeight;

/// Creates a [WidthAttribute] with a specific [width].
///
/// The returned [WidthAttribute] instance imposes the given [width] as
/// a fixed size, ignoring any minimum or maximum width constraints.
///
/// [width]: The fixed width value for the constraints.
const width = WidthAttributeUtility.selfBuilder;

/// Creates a [HeightAttriubte] with a specific [height].
///
/// The returned [HeightAttribute] instance imposes the given [height] as
/// a fixed size, ignoring any minimum or maximum height constraints.
/// [height]: The fixed height value for the constraints.
const height = HeightAttributeUtility.selfBuilder;

class ContainerUtility<T> extends MixUtility<T, ContainerMixAttribute> {
  static const selfBuilder = ContainerUtility(MixUtility.selfBuilder);
  const ContainerUtility(super.builder);

  T _only({
    AlignmentGeometryAttribute? alignment,
    PaddingAttribute? padding,
    MarginAttribute? margin,
    BackgroundColorAttribute? color,
    DecorationAttribute? decoration,
    BoxConstraintsAttribute? constraints,
    WidthAttribute? width,
    HeightAttribute? height,
    TransformAttribute? transform,
    ClipBehaviorAttribute? clipBehavior,
  }) {
    return builder(
      ContainerMixAttribute(
        alignment: alignment,
        padding: padding,
        margin: margin,
        constraints: constraints,
        decoration: decoration,
        transform: transform,
        clipBehavior: clipBehavior,
        color: color,
        width: width,
        height: height,
      ),
    );
  }

  BoxDecorationUtility<T> get decoration {
    return BoxDecorationUtility((decoration) => _only(decoration: decoration));
  }

  AlignmentUtility<T> get alignment {
    return AlignmentUtility((alignment) => call(alignment: alignment));
  }

  PaddingAttributeUtility<T> get padding {
    return PaddingAttributeUtility(
      (padding) => _only(padding: PaddingAttribute.raw(padding)),
    );
  }

  MarginAttributeUtility<T> get margin {
    return MarginAttributeUtility(
      (margin) => _only(margin: MarginAttribute.raw(margin)),
    );
  }

  BackgroundColorAttributeUtility<T> get color {
    return BackgroundColorAttributeUtility(
      (color) => _only(color: BackgroundColorAttribute(color)),
    );
  }

  BoxConstraintsUtility<T> get constraints {
    return BoxConstraintsUtility(
      (constraints) => _only(constraints: constraints),
    );
  }

  WidthAttributeUtility<T> get width {
    return WidthAttributeUtility((width) => call(width: width));
  }

  HeightAttributeUtility<T> get height {
    return HeightAttributeUtility((height) => call(height: height));
  }

  TransformAttributeUtility<T> get transform {
    return TransformAttributeUtility((transform) => call(transform: transform));
  }

  ClipBehaviorAttributeUtility<T> get clipBehavior {
    return ClipBehaviorAttributeUtility(
      (clipBehavior) => call(clipBehavior: clipBehavior),
    );
  }

  T call({
    AlignmentGeometry? alignment,
    EdgeInsets? padding,
    EdgeInsets? margin,
    BoxConstraints? constraints,
    double? width,
    double? height,
    BoxDecoration? decoration,
    Matrix4? transform,
    Clip? clipBehavior,
    Color? color,
  }) {
    final attribute = ContainerMixAttribute(
      alignment: AlignmentGeometryAttribute.maybeFrom(alignment),
      padding: PaddingAttribute.maybeFrom(padding),
      margin: MarginAttribute.maybeFrom(margin),
      constraints: BoxConstraintsAttribute.maybeFrom(constraints),
      decoration: BoxDecorationAttribute.maybeFrom(decoration),
      transform: TransformAttribute.maybeFrom(transform),
      clipBehavior: ClipBehaviorAttribute.maybeFrom(clipBehavior),
      color: BackgroundColorAttribute.maybeFrom(color),
      width: WidthAttribute.maybeFrom(width),
      height: HeightAttribute.maybeFrom(height),
    );

    return builder(attribute);
  }
}
