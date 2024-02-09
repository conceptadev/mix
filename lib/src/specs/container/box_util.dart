import 'package:flutter/material.dart';

import '../../attributes/border/border_radius_util.dart';
import '../../attributes/border/border_util.dart';
import '../../attributes/color/color_util.dart';
import '../../attributes/constraints/constraints_dto.dart';
import '../../attributes/constraints/constraints_util.dart';
import '../../attributes/decoration/decoration_dto.dart';
import '../../attributes/decoration/decoration_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/shadow/shadow_util.dart';
import '../../attributes/spacing/spacing_dto.dart';
import '../../attributes/spacing/spacing_util.dart';
import 'box_attribute.dart';

const box = BoxSpecUtility();

/// 'border' - A Utility for defining border values for a [Box] widget
///
/// An instance of `BoxSpecBorderUtility<BoxSpecAttribute>`, to define border
/// values for box widgets. It provides a structured approach to applying border, enhancing
/// the layout composition with clarity and precision.
///
/// BoxSpecBorderUtility provides a set of methods to define border values for a [Box] widget,
/// and combines [BoxBorderUtility] and [BorderRadiusGeometryUtility] to allow for a more semantic consistent API.
///
/// Examples:
///
/// Uniform border:
///
/// ```dart
/// final uniform = border(
///   color: Colors.red,
///   width: 2,
///   style: BorderStyle.solid,
///   strokeAlign: 0.5,
/// );
/// ```
///
/// Individual side border:
///
/// ```dart
/// final topBorder = border.top(
///   color: Colors.red,
///   width: 2,
///   style: BorderStyle.solid,
///   strokeAlign: 0.5,
/// );
///
/// final bottomBorder = border.bottom(...);
/// final leftBorder = border.left(...);
/// final rightBorder = border.right(...);
///
/// ```
///
/// Horizontal and vertical borders:
///
/// ```dart
/// final horizontal = border.horizontal(...); // Applies border on the left and right.
/// final vertical = border.vertical(...); // Applies border on the top and bottom.
/// ```
///
/// See also:
/// - [BoxSpecBorderUtility]
/// - [BoxBorderUtility]
/// - [BorderRadiusGeometryUtility]
/// - [BoxSpecAttribute]
final border = box.border;
final borderDirectional = box.borderDirectional;

final borderRadius = box.borderRadius;

final borderRadiusDirectional = box.borderRadiusDirectional;

/// `backgroundColor` - A Utility for defining [BoxDecoration] color value for a [Box] widget
final backgroundColor = box.color;

/// 'width' - A Utility for defining the width value of a [Box] widget
///
/// An instance of `DoubleUtility<BoxSpecAttribute>`, to define width
///
/// Examples:
///
/// ```dart
/// final width = width(100); // Sets width to 100.
/// ```
///
/// See also:
/// - [DoubleUtility]
/// - [BoxSpecAttribute]
final width = box.width;

/// 'height' - A Utility for defining the height value of a [Box] widget
///
/// An instance of `DoubleUtility<BoxSpecAttribute>`, to define height
///
/// Examples:
///
/// ```dart
/// final height = height(100); // Sets height to 100.
/// ```
///
/// See also:
/// - [DoubleUtility]
/// - [BoxSpecAttribute]
final height = box.height;

/// 'minHeight' - A Utility for Defining minHeight Values for a [BoxConstraints] of a Box widget
///
/// An instance of `DoubleUtility<BoxSpecAttribute>`, utilized in Flutter to define minHeight
///
/// Examples:
///
/// ```dart
/// final minHeight = minHeight(100); // Sets minHeight to 100.
/// ```
///
/// See also:
/// - [DoubleUtility]
/// - [BoxSpecAttribute]
/// - [BoxConstraintsDto]
/// - [BoxConstraintsUtility]
final minHeight = box.minHeight;

/// 'maxHeight' - A Utility for Defining maxHeight Values for a [BoxConstraints] of a Box widget
///
/// An instance of `DoubleUtility<BoxSpecAttribute>`, utilized in Flutter to define maxHeight
///
/// Examples:
///
/// ```dart
/// final maxHeight = maxHeight(100); // Sets maxHeight to 100.
/// ```
///
/// See also:
/// - [DoubleUtility]
/// - [BoxSpecAttribute]
/// - [BoxConstraintsDto]
/// - [BoxConstraintsUtility]
final maxHeight = box.maxHeight;

/// `minWidth` - Utility for defining minimum width for Box widgets
///
/// This utility, an instance of `DoubleUtility<BoxSpecAttribute>`, is used to specify the minimum width constraint
/// for a Box widget in Flutter. It ensures a Box widget does not shrink below the defined minimum width.
///
/// Example:
/// ```dart
/// final minWidthValue = minWidth(100); // Sets the minimum width to 100.
/// ```
///
/// See also:
/// - [DoubleUtility]
/// - [BoxSpecAttribute]
/// - [BoxConstraintsDto]
/// - [BoxConstraintsUtility]
final minWidth = box.minWidth;

/// 'maxWidth' - A Utility for defining maxWidth for a `BoxConstraints` on a Box widget
///
/// An instance of `DoubleUtility<BoxSpecAttribute>`, utilized in Flutter to define maxWidth
///
/// Examples:
///
/// ```dart
/// final maxWidth = maxWidth(100); // Sets maxWidth to 100.
/// ```
final maxWidth = box.maxWidth;

/// `padding` - Utility for defining padding values for Box widgets
///
/// An instance of `SpacingUtility<BoxSpecAttribute>`, this utility offers flexible ways to apply padding.
/// It supports uniform, horizontal, vertical, side-specific, directional, and individual side padding.
///
/// Example shorthand usage:
/// - `padding(10)`: Uniform padding of 10 units on all sides.
/// - `padding(10, 20)`: 10 units vertical (top and bottom), 20 units horizontal (left and right).
/// - `padding(10, 20, 30)`: 10 units top, 20 units horizontal, 30 units bottom.
/// - `padding(10, 20, 30, 40)`: 10 units top, 20 units right, 30 units bottom, 40 units left.
///
/// Example method usage:
/// - Uniform: `padding.all(10)` for 10 units on all sides.
/// - Side-specific: `padding.only(top: 10, bottom: 20, left: 30, right: 40)`.
/// - Individual sides: `padding.top(5)`, `padding.bottom(10)`, `padding.left(15)`, `padding.right(20)`.
/// - Horizontal/Vertical: `padding.horizontal(15)`, `padding.vertical(20)`.
/// - Directional (RTL): `padding.start(10)`, `padding.end(10)`.
///
/// See also:
/// - [SpacingUtility]
/// - [SpacingDto]
/// - [BoxSpecAttribute]
final padding = box.padding;

/// `margin` - Utility for defining margin values for Box widgets
///
/// An instance of `SpacingUtility<BoxSpecAttribute>`, this utility provides versatile ways to apply margin.
/// It supports uniform, horizontal, vertical, side-specific, directional, and individual side margins.
///
/// Example shorthand usage:
/// - `margin(10)`: Uniform margin of 10 units on all sides.
/// - `margin(10, 20)`: 10 units vertical (top and bottom), 20 units horizontal (left and right).
/// - `margin(10, 20, 30)`: 10 units top, 20 units horizontal, 30 units bottom.
/// - `margin(10, 20, 30, 40)`: 10 units top, 20 units right, 30 units bottom, 40 units left.
///
/// Example method usage:
/// - Uniform: `margin.all(10)` for 10 units on all sides.
/// - Side-specific: `margin.only(top: 10, bottom: 20, left: 30, right: 40)`.
/// - Individual sides: `margin.top(5)`, `margin.bottom(10)`, `margin.left(15)`, `margin.right(20)`.
/// - Horizontal/Vertical: `margin.horizontal(15)`, `margin.vertical(20)`.
/// - Directional (RTL): `margin.start(10)`, `margin.end(10)`.
///
/// See also:
/// - [SpacingDto]
/// - [SpacingUtility]
/// - [BoxSpecAttribute]
final margin = box.margin;

/// `alignment` - Utility for defining alignment values for Box widgets
///
/// An instance of `AlignmentUtility<BoxSpecAttribute>`, this utility provides structured methods
/// to apply alignment to box widgets, enhancing layout composition with precision.
///
/// Shorthand Usage Examples:
/// - `alignment.center()`: Aligns to the center.
/// - `alignment.topLeft()`, `alignment.bottomRight()`: Aligns to top left or bottom right.
/// - `alignment.topCenter()`, `alignment.bottomCenter()`: Aligns to top or bottom center.
/// - `alignment.centerLeft()`, `alignment.centerRight()`: Aligns to center left or right.
///
/// Custom Alignment:
/// - `alignment.only(x: 0.5, y: 0.5)`: Custom horizontal and vertical alignment.
/// - `alignment.only(start: 0.5, y: 0.5)`: Custom alignment considering text direction.
///
/// The `x` parameter sets horizontal alignment, `y` sets vertical. `start` aligns based on text direction,
/// overriding `x`.
///
/// See also:
/// - [Alignment]
/// - [AlignmentDirectional]
/// - [AlignmentUtility]
/// - [BoxSpecAttribute]
final alignment = box.alignment;

/// `clipBehavior` - Utility for defining clip behavior values for Box widgets
///
/// An instance of `ClipUtility<BoxSpecAttribute>`, this utility allows for specifying clip behaviors
/// for box widgets, contributing to clear and precise layout compositions.
///
/// Shorthand Usage Examples:
/// - `clipBehavior.antiAlias()`: Applies anti-aliasing.
/// - `clipBehavior.antiAliasWithSaveLayer()`: Anti-aliasing with a save layer.
/// - `clipBehavior.hardEdge()`: Applies hard edge clipping.
/// - `clipBehavior.none()`: No clipping.
///
/// See also:
/// - [Clip]
/// - [ClipUtility]
/// - [BoxSpecAttribute]
final clipBehavior = box.clipBehavior;

/// `elevation` - A Utility for Defining Elevation Values for Box widgets
///
/// An instance of `ElevationUtility<BoxSpecAttribute>` for setting elevation using predefined shadows.
///
/// This utility simplifies the process of applying consistent elevation effects
/// across the application.
///
/// Examples:
///
/// ```dart
/// final none = elevation.none(); // No elevation.
/// final two = elevation.two(); // Elevation of 2.
/// final three = elevation.three(); // Elevation of 3.
/// final four = elevation.four(); // Elevation of 4.
/// final six = elevation.six(); // Elevation of 6.
/// final eight = elevation.eight(); // Elevation of 8.
/// final nine = elevation.nine(); // Elevation of 9.
/// final twelve = elevation.twelve(); // Elevation of 12.
/// final sixteen = elevation.sixteen(); // Elevation of 16.
/// final twentyFour = elevation.twentyFour(); // Elevation of 24.
/// ```
///
/// See also:
/// - [ElevationUtility]
/// - [BoxSpecAttribute]
/// - [BoxShadowDto]
/// - [BoxShadow]
final elevation = box.elevation;

final radialGradient = box.decoration.gradient.radial;

class BoxSpecUtility extends SpecUtility<BoxSpecAttribute> {
  const BoxSpecUtility();

  BoxDecorationUtility<BoxSpecAttribute> get decoration {
    return BoxDecorationUtility(
      (decoration) => only(decoration: decoration),
    );
  }

  BoxDecorationUtility<BoxSpecAttribute> get foregroundDecoration {
    return BoxDecorationUtility(
      (foregroundDecoration) =>
          only(foregroundDecoration: foregroundDecoration),
    );
  }

  AlignmentUtility<BoxSpecAttribute> get alignment {
    return AlignmentUtility((alignment) => only(alignment: alignment));
  }

  SpacingUtility<BoxSpecAttribute> get padding {
    return SpacingUtility((padding) => only(padding: padding));
  }

  SpacingUtility<BoxSpecAttribute> get margin {
    return SpacingUtility((margin) => only(margin: margin));
  }

  // We use BoxDecoration for better Decoration support to avoid weird issues
  ColorUtility<BoxSpecAttribute> get color => decoration.color;

  ElevationUtility<BoxSpecAttribute> get elevation => decoration.elevation;

  ShapeDecorationUtility<BoxSpecAttribute> get shapeDecoration =>
      ShapeDecorationUtility((decoration) => only(decoration: decoration));

  BoxConstraintsUtility<BoxSpecAttribute> get constraints {
    return BoxConstraintsUtility(
      (constraints) => only(constraints: constraints),
    );
  }

  Matrix4Utility<BoxSpecAttribute> get transform {
    return Matrix4Utility((transform) => only(transform: transform));
  }

  ClipUtility<BoxSpecAttribute> get clipBehavior {
    return ClipUtility((clipBehavior) => only(clipBehavior: clipBehavior));
  }

  BorderRadiusGeometryUtility<BoxSpecAttribute> get borderRadius =>
      decoration.borderRadius;

  BorderRadiusDirectionalUtility<BoxSpecAttribute>
      get borderRadiusDirectional => decoration.borderRadiusDirectional;

  BorderUtility<BoxSpecAttribute> get border => decoration.border;

  BorderDirectionalUtility<BoxSpecAttribute> get borderDirectional =>
      decoration.borderDirectional;

  BoxShadowListUtility<BoxSpecAttribute> get shadows => decoration.boxShadows;

  BoxShadowUtility<BoxSpecAttribute> get shadow => decoration.boxShadow;

  ///  Constraints utilities
  DoubleUtility<BoxSpecAttribute> get maxWidth => constraints.maxWidth;

  DoubleUtility<BoxSpecAttribute> get minWidth => constraints.minWidth;

  DoubleUtility<BoxSpecAttribute> get maxHeight => constraints.maxHeight;

  DoubleUtility<BoxSpecAttribute> get minHeight => constraints.minHeight;

  DoubleUtility<BoxSpecAttribute> get width =>
      DoubleUtility((width) => only(width: width));

  DoubleUtility<BoxSpecAttribute> get height =>
      DoubleUtility((height) => only(height: height));

  BoxSpecAttribute only({
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
    return BoxSpecAttribute(
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
    );
  }
}
