import 'package:flutter/material.dart';

import '../../attributes/border/border_radius_util.dart';
import '../../attributes/border/border_util.dart';
import '../../attributes/color/color_util.dart';
import '../../attributes/constraints/constraints_dto.dart';
import '../../attributes/constraints/constraints_util.dart';
import '../../attributes/decoration/decoration_dto.dart';
import '../../attributes/decoration/decoration_util.dart';
import '../../attributes/gradient/gradient_util.dart';
import '../../attributes/scalars/scalar_util.dart';
import '../../attributes/shadow/shadow_util.dart';
import '../../attributes/spacing/spacing_dto.dart';
import '../../attributes/spacing/spacing_util.dart';
import '../../core/attribute.dart';
import '../../decorators/widget_decorators_util.dart';
import 'box_attribute.dart';

const box = BoxSpecUtility(selfBuilder);

const $box = box;

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

/// - [BoxConstraintsUtility]
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
  const BoxSpecUtility(super.builder);

  BoxDecorationUtility<T> get decoration {
    return BoxDecorationUtility(
      (decoration) => only(decoration: decoration),
    );
  }

  BoxDecorationUtility<T> get foregroundDecoration {
    return BoxDecorationUtility(
      (foregroundDecoration) =>
          only(foregroundDecoration: foregroundDecoration),
    );
  }

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
  AlignmentUtility<T> get alignment {
    return AlignmentUtility((alignment) => only(alignment: alignment));
  }

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
  SpacingUtility<T> get padding {
    return SpacingUtility((padding) => only(padding: padding));
  }

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
  SpacingUtility<T> get margin {
    return SpacingUtility((margin) => only(margin: margin));
  }

  // `color` - Utility for defining color values for Box widgets
  //
  // An instance of `ColorUtility<BoxSpecAttribute>`, this utility provides structured methods
  // to apply color to box widgets, enhancing layout composition with clarity and precision.
  //
  // Example shorthand usage:
  // - `color(Colors.red)`: Applies red color.
  // - `color.red()`: Applies red color.
  //
  // See also:
  // - [ColorUtility]
  // - [BoxSpecAttribute]
  ColorUtility<T> get color => decoration.color;

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
  ElevationUtility<T> get elevation => decoration.elevation;

  GradientUtility<T> get gradient => decoration.gradient;

  RadialGradientUtility<T> get radialGradient => gradient.radial;
  LinearGradientUtility<T> get linearGradient => gradient.linear;

  ShapeDecorationUtility<T> get shapeDecoration =>
      ShapeDecorationUtility((decoration) => only(decoration: decoration));

  BoxConstraintsUtility<T> get constraints {
    return BoxConstraintsUtility(
      (constraints) => only(constraints: constraints),
    );
  }

  Matrix4Utility<T> get transform {
    return Matrix4Utility((transform) => only(transform: transform));
  }

  AlignmentUtility<T> get transformAlignment {
    return AlignmentUtility(
      (transformAlignment) => only(alignment: transformAlignment),
    );
  }

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
  ClipUtility<T> get clipBehavior {
    return ClipUtility((clipBehavior) => only(clipBehavior: clipBehavior));
  }

  BorderRadiusGeometryUtility<T> get borderRadius => decoration.borderRadius;

  BorderRadiusDirectionalUtility<T> get borderRadiusDirectional =>
      decoration.borderRadiusDirectional;

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
  BorderUtility<T> get border => decoration.border;

  BorderDirectionalUtility<T> get borderDirectional =>
      decoration.borderDirectional;

  BoxShadowListUtility<T> get shadows => decoration.boxShadows;

  BoxShadowUtility<T> get shadow => decoration.boxShadow;

  /// 'maxWidth' - A Utility for defining maxWidth for a `BoxConstraints` on a Box widget
  ///
  /// An instance of `DoubleUtility<BoxSpecAttribute>`, utilized in Flutter to define maxWidth
  ///
  /// Examples:
  ///
  /// ```dart
  /// final maxWidth = maxWidth(100); // Sets maxWidth to 100.
  /// ```
  DoubleUtility<T> get maxWidth => constraints.maxWidth;

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
  DoubleUtility<T> get minWidth => constraints.minWidth;

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
  DoubleUtility<T> get maxHeight => constraints.maxHeight;

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
  DoubleUtility<T> get minHeight => constraints.minHeight;

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
  DoubleUtility<T> get width => DoubleUtility((width) => only(width: width));

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
  DoubleUtility<T> get height =>
      DoubleUtility((height) => only(height: height));

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
