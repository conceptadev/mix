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

/// `padding` - Provides a comprehensive utility for defining padding attribute
///
/// `padding` is an instance of `SpacingUtility<T>`, offering a range of methods to apply custom padding
/// to various sides of a widget. Each method returns an object that can be used to construct a widget with
/// the specified padding attributes.
///
/// Examples:
///
/// Applying uniform padding:
/// ```dart
/// final uniform = padding.all(10); // Applies 10 units of padding on all sides.
/// ```
///
/// Applying horizontal padding:
/// ```dart
/// final horizontal = padding.horizontal(15); // Applies 15 units of padding on the left and right.
/// ```
///
/// Applying vertical padding:
/// ```dart
/// final vertical = padding.vertical(20); // Applies 20 units of padding on the top and bottom.
/// ```
///
/// Applying different padding values for each side:
/// ```dart
/// final custom = padding.only(top: 10, bottom: 20, left: 30, right: 40);
/// // Applies 10 units on top, 20 units on bottom, 30 units on left, and 40 units on right.
/// ```
///
/// Applying padding to a specific side:
/// ```dart
/// final top = padding.top(5); // Applies 5 units of padding at the top.
/// final bottom = padding.bottom(5); // Applies 5 units of padding at the bottom.
/// final left = padding.left(8); // Applies 8 units of padding on the left side.
/// final right = padding.right(8); // Applies 8 units of padding on the right side.
/// ```
///
/// Applying directional padding in RTL (Right-to-Left) layouts:
/// ```dart
/// final start = padding.start(10); // Applies 10 units of padding at the start side (considering text direction).
/// final end = padding.end(10); // Applies 10 units of padding at the end side (considering text direction).
/// ```
///
/// Using `SpacingUtility` callable method for flexible padding:
/// - 1 parameter: uniform spacing on all sides.
/// - 2 parameters: first for top and bottom, second for left and right.
/// - 3 parameters: first for top, second for left and right, third for bottom.
/// - 4 parameters: applied to top, right, bottom, and left respectively.
///
/// Examples:
/// - `padding(10)`: uniform padding of 10 units on all sides.
/// - `padding(10, 20)`: top and bottom padding of 10 units, left and right padding of 20 units.
/// - `padding(10, 20, 30)`: top padding of 10 units, left and right padding of 20 units, bottom padding of 30 units.
/// - `padding(10, 20, 30, 40)`: top padding of 10 units, right padding of 20 units, bottom padding of 30 units, left padding of 40 units.
///
/// `padding` effectively leverages `SpacingUtility<T>` to create a versatile and readable way of applying padding,
/// making it easier to manage spacing in Flutter's layout system.
const padding = PaddingAttributeUtility.selfBuilder;

/// `margin` - Provides a comprehensive utility for defining margin attribute
///
/// `margin` is an instance of `SpacingUtility<T>`, offering a range of methods to apply custom margin
/// to various sides of a widget. Each method returns an object that can be used to construct a widget with
/// the specified margin attributes.
///
/// Examples:
///
/// Applying uniform margin:
/// ```dart
/// final uniform = margin.all(10); // Applies 10 units of margin on all sides.
/// ```
///
/// Applying horizontal margin:
/// ```dart
/// final horizontal = margin.horizontal(15); // Applies 15 units of margin on the left and right.
/// ```
///
/// Applying vertical margin:
/// ```dart
/// final vertical = margin.vertical(20); // Applies 20 units of margin on the top and bottom.
/// ```
///
/// Applying different margin values for each side:
/// ```dart
/// final custom = margin.only(top: 10, bottom: 20, left: 30, right: 40);
/// // Applies 10 units on top, 20 units on bottom, 30 units on left, and 40 units on right.
/// ```
///
/// Applying margin to a specific side:
/// ```dart
/// final top = margin.top(5); // Applies 5 units of margin at the top.
/// final bottom = margin.bottom(5); // Applies 5 units of margin at the bottom.
/// final left = margin.left(8); // Applies 8 units of margin on the left side.
/// final right = margin.right(8); // Applies 8 units of margin on the right side.
/// ```
///
/// Applying directional margin in RTL (Right-to-Left) layouts:
/// ```dart
/// final start = margin.start(10); // Applies 10 units of margin at the start side (considering text direction).
/// final end = margin.end(10); // Applies 10 units of margin at the end side (considering text direction).
/// ```
///
/// Using `SpacingUtility` callable method for flexible margin:
/// - 1 parameter: uniform spacing on all sides.
/// - 2 parameters: first for top and bottom, second for left and right.
/// - 3 parameters: first for top, second for left and right, third for bottom.
/// - 4 parameters: applied to top, right, bottom, and left respectively.
///
/// Examples:
/// - `margin(10)`: uniform margin of 10 units on all sides.
/// - `margin(10, 20)`: top and bottom margin of 10 units, left and right margin of 20 units.
/// - `margin(10, 20, 30)`: top margin of 10 units, left and right margin of 20 units, bottom margin of 30 units.
/// - `margin(10, 20, 30, 40)`: top margin of 10 units, right margin of 20 units, bottom margin of 30 units, left margin of 40 units.
///
/// `margin` effectively leverages `SpacingUtility<T>` to create a versatile and readable way of applying margin,
/// making it easier to manage spacing in Flutter's layout system.
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
