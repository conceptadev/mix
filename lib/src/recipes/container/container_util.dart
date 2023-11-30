import 'package:flutter/material.dart';

import '../../attributes/border/border_radius_util.dart';
import '../../attributes/border/border_util.dart';
import '../../attributes/color/color_dto.dart';
import '../../attributes/color/color_util.dart';
import '../../attributes/constraints/constraints_attribute.dart';
import '../../attributes/constraints/constraints_util.dart';
import '../../attributes/decoration/decoration_attribute.dart';
import '../../attributes/decoration/decoration_util.dart';
import '../../attributes/scalars/scalar_attribute_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/scalars/scalars_attribute.dart';
import '../../attributes/shadow/shadow_util.dart';
import '../../attributes/spacing/spacing_attribute.dart';
import '../../attributes/spacing/spacing_dto.dart';
import 'container_attribute.dart';

const container = ContainerUtility.selfBuilder;
const box = ContainerUtility.selfBuilder;
const boxShadow = BoxShadowUtility.selfBuilder;

const border = BoxBorderUtility.selfBuilder;
const clipBehavior = ClipBehaviorAttributeUtility.selfBuilder;

/// Predefined utility constants for creating padding attributes.
const padding = PaddingAttributeUtility.selfBuilder;

/// Predefined utility constants for creating margin attributes.
const margin = MarginAttributeUtility.selfBuilder;

const elevation = ElevationUtility.selfBuilder;

// Provides an utility for creating a uniform BorderRadiusAttribute for all corners.
const borderRadius = BorderRadiusGeometryUtility.selfBuilder;
const alignment = AlignmentGeometryAttributeUtility.selfBuilder;

const boxConstraints = BoxConstraintsUtility.selfBuilder;

const boxDecoration = BoxDecorationUtility.selfBuilder;

const backgroundColor = BackgroundColorAttributeUtility.selfBuilder;

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
const width = DoubleUtility(WidthAttribute.new);

/// Creates a [BoxConstraintsAttribute] with a specific [height].
///
/// Similar to [width], this function sets a fixed [height] for the constraints,
/// overriding any minimum or maximum height constraints.
///
/// [height]: The fixed height value for the constraints.
const height = DoubleUtility(HeightAttribute.new);

class ContainerUtility<T> extends MixUtility<T, ContainerMixAttribute> {
  static const selfBuilder = ContainerUtility(MixUtility.selfBuilder);
  const ContainerUtility(super.builder);

  T _alignment(AlignmentGeometry alignment) => call(alignment: alignment);
  T _padding(SpacingDto value) => builder(
        ContainerMixAttribute(padding: PaddingAttribute.raw(value)),
      );
  T _margin(SpacingDto value) => builder(
        ContainerMixAttribute(margin: MarginAttribute.raw(value)),
      );
  T _color(ColorDto color) => _only(color: BackgroundColorAttribute(color));
  T _decoration(BoxDecorationAttribute decoration) =>
      _only(decoration: decoration);

  T _constraints(BoxConstraintsAttribute constraints) =>
      _only(constraints: constraints);
  T _width(double width) => call(width: width);
  T _height(double height) => call(height: height);
  T _transform(Matrix4 transform) => call(transform: transform);
  T _clipBehavior(Clip clipBehavior) => call(clipBehavior: clipBehavior);

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

  ElevationUtility<T> get elevation => decoration.elevation;

  AlignmentUtility<T> get alignment => AlignmentUtility(_alignment);
  PaddingAttributeUtility<T> get padding => PaddingAttributeUtility(_padding);
  MarginAttributeUtility<T> get margin => MarginAttributeUtility(_margin);
  ColorUtility<T> get color => ColorUtility(_color);

  BoxConstraintsUtility<T> get constraints =>
      BoxConstraintsUtility(_constraints);
  DoubleUtility<T> get width => DoubleUtility(_width);
  DoubleUtility<T> get height => DoubleUtility(_height);
  Matrix4Utility<T> get transform => Matrix4Utility(_transform);
  ClipUtility<T> get clipBehavior => ClipUtility(_clipBehavior);
  BoxDecorationUtility<T> get decoration => BoxDecorationUtility(_decoration);

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
