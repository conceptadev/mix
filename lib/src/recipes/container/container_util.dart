import 'package:flutter/material.dart';

import '../../attributes/alignment_attribute.dart';
import '../../attributes/color_attribute.dart';
import '../../attributes/constraints/constraints_attribute.dart';
import '../../attributes/constraints/constraints_util.dart';
import '../../attributes/decoration/decoration_attribute.dart';
import '../../attributes/spacing_attribute.dart';
import '../../attributes/transform_attribute.dart';
import '../../core/extensions/values_ext.dart';
import '../../utils/border_radius_util.dart';
import '../../utils/decoration_util.dart';
import '../../utils/scalar_util.dart';
import '../../utils/shadow_util.dart';
import '../../utils/spacing_util.dart';
import 'container_attribute.dart';

const container = ContainerUtility.selfBuilder;
const box = ContainerUtility.selfBuilder;
const boxShadow = BoxShadowUtility.selfBuilder;
const boxDecoration = BoxDecorationUtility.selfBuilder;

/// Predefined utility constants for creating padding attributes.
const padding = PaddingUtility.selfBuilder;

/// Predefined utility constants for creating margin attributes.
const margin = MarginUtility.selfBuilder;

final backgroundColor = boxDecoration.color;

final elevation = boxDecoration.elevation;

// Provides an utility for creating a uniform BorderRadiusAttribute for all corners.
const borderRadius = BorderRadiusUtility.selfBuilder;
const alignment = AlignmentUtility.selfBuilder;

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
  T _padding(PaddingAttribute padding) => as(ContainerMixAttribute(
        padding: padding,
      ));
  T _margin(MarginAttribute margin) => as(ContainerMixAttribute(
        margin: margin,
      ));
  T _color(ColorDto color) => _only(color: color);
  T _decoration(BoxDecorationAttribute decoration) =>
      _only(decoration: decoration);

  T _constraints(BoxConstraintsAttribute constraints) =>
      _only(constraints: constraints);
  T _width(double width) => call(width: width);
  T _height(double height) => call(height: height);
  T _transform(Matrix4 transform) => _only(transform: transform.toAttribute());
  T _clipBehavior(Clip clipBehavior) => _only(clipBehavior: clipBehavior);

  T _only({
    AlignmentGeometryAttribute? alignment,
    PaddingAttribute? padding,
    MarginAttribute? margin,
    ColorDto? color,
    DecorationAttribute? decoration,
    BoxConstraintsAttribute? constraints,
    WidthAttribute? width,
    HeightAttribute? height,
    TransformAttribute? transform,
    Clip? clipBehavior,
  }) {
    return as(
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

  AlignmentUtility<T> get alignment => AlignmentUtility(_alignment);
  PaddingUtility<T> get padding => PaddingUtility(_padding);
  MarginUtility<T> get margin => MarginUtility(_margin);
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
    Color? color,
    BoxConstraints? constraints,
    double? width,
    double? height,
    Matrix4? transform,
    Clip? clipBehavior,
  }) {
    final attribute = ContainerMixAttribute(
      alignment: alignment?.toAttribute(),
      padding: padding == null ? null : PaddingAttribute.from(padding),
      margin: margin == null ? null : MarginAttribute.from(margin),
      constraints: constraints?.toAttribute(),
      transform: transform?.toAttribute(),
      clipBehavior: clipBehavior,
      color: color?.toAttribute(),
      width: WidthAttribute.maybeFrom(width),
      height: HeightAttribute.maybeFrom(height),
    );

    return as(attribute);
  }
}
