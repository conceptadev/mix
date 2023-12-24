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
import '../../core/extensions/values_ext.dart';
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
/// You can do the same for `vertical` borders.
///
final border = box.border;

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
/// - [Box]
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
/// - [Box]
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
/// - [BoxConstraints]
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
/// - [BoxConstraints]
/// - [BoxConstraintsUtility]
final maxHeight = box.maxHeight;

/// 'minWidth' - A Utility for defining minWidth Values for a [BoxConstraints] of a Box widget
///
/// An instance of `DoubleUtility<BoxSpecAttribute>`, utilized in Flutter to define minWidth
///
/// Examples:
///
/// ```dart
/// final minWidth = minWidth(100); // Sets minWidth to 100.
/// ```
///
/// See also:
/// - [DoubleUtility]
/// - [BoxSpecAttribute]
/// - [BoxConstraintsDto]
/// - [BoxConstraints]
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

/// `padding` - A Utility for Defining Padding Values for Box widgets
///
/// An instance of `SpacingUtility<BoxSpecAttribute>`, utilized in Flutter to define padding
/// values for box widgets. It provides a structured approach to applying padding, enhancing
/// the layout composition with clarity and precision.
///
/// Examples:
///
/// Uniform padding:
///
/// ```dart
/// final uniform = padding.all(10); // Applies 10 units of padding on all sides.
/// ```
///
/// Horizontal padding:
///
/// ```dart
/// final horizontal = padding.horizontal(15); // Applies 15 units of padding on the left and right.
/// ```
///
/// Vertical padding:
///
/// ```dart
/// final vertical = padding.vertical(20); // Applies 20 units of padding on the top and bottom.
/// ```
///
/// Individual side padding:
///
/// ```dart
/// final custom = padding.only(top: 10, bottom: 20, left: 30, right: 40);
/// // Applies 10 units on top, 20 units on bottom, 30 units on left, and 40 units on right.
/// ```
///
/// Padding to a specific side:
///
/// ```dart
/// final top = padding.top(5); // Applies 5 units of padding at the top.
/// final bottom = padding.bottom(5); // Applies 5 units of padding at the bottom.
/// final left = padding.left(8); // Applies 8 units of padding on the left side.
/// final right = padding.right(8); // Applies 8 units of padding on the right side.
/// ```
///
/// Directional padding in RTL (Right-to-Left) layouts:
///
/// ```dart
/// final start = padding.start(10); // Applies 10 units of padding at the start side (considering text direction).
/// final end = padding.end(10); // Applies 10 units of padding at the end side (considering text direction).
/// ```
///
/// Flexible Padding with Callable Method
/// 1 parameter: Uniform padding.
/// 2 parameters: Vertical and horizontal padding.
/// 3 parameters: Top, horizontal, and bottom padding.
/// 4 parameters: Top, right, bottom, left padding.
///
/// Examples:
/// - `padding(10)`: 10 units uniformly.
/// - `padding(10, 20)`: 10 units top and bottom, 20 units left and right.
/// - `padding(10, 20, 30)`: 10 units top, 20 units left and right, 30 units bottom.
/// - `padding(10, 20, 30, 40)`: 10 units top, 20 units right, 30 units bottom, 40 units left.
///
/// `padding` effectively leverages `SpacingUtility<T>` to create a versatile and readable way of applying padding,
/// making it easier to manage spacing in Flutter's layout system.
///
/// See also:
/// - [SpacingUtility]
/// - [SpacingDto]
/// - [BoxSpecAttribute]
final padding = box.padding;

/// `margin` - A Utility for Defining Padding Values for Box widgets
///
/// An instance of `SpacingUtility<BoxSpecAttribute>`, utilized in Flutter to define margin
/// values for box widgets. It provides a structured approach to applying margin, enhancing
/// the layout composition with clarity and precision.
///
/// Examples:
///
/// Uniform margin:
///
/// ```dart
/// final uniform = margin.all(10); // Applies 10 units of margin on all sides.
/// ```
///
/// Horizontal margin:
///
/// ```dart
/// final horizontal = margin.horizontal(15); // Applies 15 units of margin on the left and right.
/// ```
///
/// Vertical margin:
///
/// ```dart
/// final vertical = margin.vertical(20); // Applies 20 units of margin on the top and bottom.
/// ```
///
/// Individual side margin:
///
/// ```dart
/// final custom = margin.only(top: 10, bottom: 20, left: 30, right: 40);
/// // Applies 10 units on top, 20 units on bottom, 30 units on left, and 40 units on right.
/// ```
///
/// Padding to a specific side:
///
/// ```dart
/// final top = margin.top(5); // Applies 5 units of margin at the top.
/// final bottom = margin.bottom(5); // Applies 5 units of margin at the bottom.
/// final left = margin.left(8); // Applies 8 units of margin on the left side.
/// final right = margin.right(8); // Applies 8 units of margin on the right side.
/// ```
///
/// Directional margin in RTL (Right-to-Left) layouts:
///
/// ```dart
/// final start = margin.start(10); // Applies 10 units of margin at the start side (considering text direction).
/// final end = margin.end(10); // Applies 10 units of margin at the end side (considering text direction).
/// ```
///
/// Flexible Padding with Callable Method
/// 1 parameter: Uniform margin.
/// 2 parameters: Vertical and horizontal margin.
/// 3 parameters: Top, horizontal, and bottom margin.
/// 4 parameters: Top, right, bottom, left margin.
///
/// Examples:
/// - `margin(10)`: 10 units uniformly.
/// - `margin(10, 20)`: 10 units top and bottom, 20 units left and right.
/// - `margin(10, 20, 30)`: 10 units top, 20 units left and right, 30 units bottom.
/// - `margin(10, 20, 30, 40)`: 10 units top, 20 units right, 30 units bottom, 40 units left.
///
/// `margin` effectively leverages `SpacingUtility<T>` to create a versatile and readable way of applying padding,
/// making it easier to manage spacing in Flutter's layout system.
///
/// See also:
/// - [SpacingUtility]
/// - [SpacingDto]
/// - [BoxSpecAttribute]
final margin = box.margin;

/// `alignment` - A Utility for Defining Alignment Values for Box widgets
///
/// An instance of `AlignmentUtility<BoxSpecAttribute>`, utilized in Flutter to define alignment
/// values for box widgets. It provides a structured approach to applying alignment, enhancing
/// the layout composition with clarity and precision.
///
/// Examples:
///
/// ```dart
/// final center = alignment.center(); // Aligns the box to the center of the parent.
/// final topLeft = alignment.topLeft(); // Aligns the box to the top left of the parent.
/// final bottomRight = alignment.bottomRight(); // Aligns the box to the bottom right of the parent.
/// ```
///
/// Sets a custom alignment based on the provided x, y, or start values.
///
/// The `x` and `start` parameters are mutually exclusive to avoid conflicts.
/// The `x` parameter sets a specific horizontal alignment, while `start` aligns based on text direction (LTR/RTL).
/// The `y` parameter sets the vertical alignment.
///
/// - `x`: Horizontal alignment value, ignored if `start` is provided.
/// - `y`: Vertical alignment value.
/// - `start`: Horizontal alignment based on text direction, overrides `x` if provided.
///
/// ```dart
/// final custom = alignment.only(x: 0.5, y: 0.5); // Aligns the box to the center of the parent.
/// final custom = alignment.only(start: 0.5, y: 0.5); // Aligns the box to the center of the parent considering text direction.
/// ```
///
/// Helper methods that are similar to methods on [Alignment] and [AlignmentDirectional].
///
/// ```dart
/// final topCenter = alignment.topCenter(); // Aligns the box to the top center of the parent.
/// final bottomCenter = alignment.bottomCenter(); // Aligns the box to the bottom center of the parent.
/// final centerLeft = alignment.centerLeft(); // Aligns the box to the center left of the parent.
/// final centerRight = alignment.centerRight(); // Aligns the box to the center right of the parent.
/// ```
/// See also:
/// - [Alignment]
/// - [AlignmentDirectional]
/// - [AlignmentUtility]
/// - [BoxSpecAttribute]
final alignment = box.alignment;

/// `clipBehavior` - A Utility for Defining Clip Behavior Values for Box widgets
///
/// An instance of `ClipUtility<BoxSpecAttribute>`, utilized in Flutter to define clip behavior
/// values for box widgets. It provides a structured approach to applying clip behavior, enhancing
/// the layout composition with clarity and precision.
///
/// Examples:
///
/// ```dart
/// final antiAlias = clipBehavior.antiAlias(); // Clips the box with anti-aliasing.
/// final antiAliasWithSaveLayer = clipBehavior.antiAliasWithSaveLayer(); // Clips the box with anti-aliasing and save layer.
/// final hardEdge = clipBehavior.hardEdge(); // Clips the box with hard edges.
/// final none = clipBehavior.none(); // Does not clip the box.
/// ```
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

class BoxSpecUtility extends SpecUtility<BoxSpecAttribute> {
  const BoxSpecUtility();

  BoxSpecAttribute _only({
    AlignmentGeometry? alignment,
    SpacingDto? padding,
    SpacingDto? margin,
    DecorationDto? decoration,
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
      transform: transform,
      clipBehavior: clipBehavior,
      width: width,
      height: height,
    );
  }

  BoxDecorationUtility<BoxSpecAttribute> get decoration {
    return BoxDecorationUtility(
      (decoration) => _only(decoration: decoration),
    );
  }

  AlignmentUtility<BoxSpecAttribute> get alignment {
    return AlignmentUtility((alignment) => call(alignment: alignment));
  }

  SpacingUtility<BoxSpecAttribute> get padding {
    return SpacingUtility((padding) => _only(padding: padding));
  }

  SpacingUtility<BoxSpecAttribute> get margin {
    return SpacingUtility((margin) => _only(margin: margin));
  }

  // We use BoxDecoration for better Decoration support to avoid weird issues
  ColorUtility<BoxSpecAttribute> get color => decoration.color;

  ElevationUtility<BoxSpecAttribute> get elevation => decoration.elevation;

  ShapeDecorationUtility<BoxSpecAttribute> get shapeDecoration =>
      ShapeDecorationUtility((decoration) => _only(decoration: decoration));

  BoxConstraintsUtility<BoxSpecAttribute> get constraints {
    return BoxConstraintsUtility(
      (constraints) => _only(constraints: constraints),
    );
  }

  Matrix4Utility<BoxSpecAttribute> get transform {
    return Matrix4Utility((transform) => call(transform: transform));
  }

  ClipUtility<BoxSpecAttribute> get clipBehavior {
    return ClipUtility((clipBehavior) => call(clipBehavior: clipBehavior));
  }

  ///  Decoration Utilities
  BoxSpecBorderUtility<BoxSpecAttribute> get border {
    return BoxSpecBorderUtility(
      (border) => _only(decoration: BoxDecorationDto(border: border)),
    );
  }

  BoxShadowListUtility<BoxSpecAttribute> get shadows => decoration.boxShadows;

  BoxShadowUtility<BoxSpecAttribute> get shadow => decoration.boxShadow;

  ///  Constraints utilities
  DoubleUtility<BoxSpecAttribute> get maxWidth => constraints.maxWidth;

  DoubleUtility<BoxSpecAttribute> get minWidth => constraints.minWidth;

  DoubleUtility<BoxSpecAttribute> get maxHeight => constraints.maxHeight;

  DoubleUtility<BoxSpecAttribute> get minHeight => constraints.minHeight;

  DoubleUtility<BoxSpecAttribute> get width =>
      DoubleUtility((width) => _only(width: width));

  DoubleUtility<BoxSpecAttribute> get height =>
      DoubleUtility((height) => _only(height: height));

  BoxSpecAttribute call({
    AlignmentGeometry? alignment,
    EdgeInsets? padding,
    EdgeInsets? margin,
    BoxConstraints? constraints,
    double? width,
    double? height,
    BoxDecoration? decoration,
    Matrix4? transform,
    Clip? clipBehavior,
  }) {
    return _only(
      alignment: alignment,
      padding: SpacingDto.maybeFrom(padding),
      margin: SpacingDto.maybeFrom(margin),
      decoration: decoration?.toDto(),
      constraints: constraints?.toDto(),
      width: width,
      height: height,
      transform: transform,
      clipBehavior: clipBehavior,
    );
  }
}

class BoxSpecBorderUtility<T extends BoxSpecAttribute>
    extends BoxBorderUtility<BoxSpecAttribute> {
  const BoxSpecBorderUtility(super.builder);

  BoxDecorationUtility<BoxSpecAttribute> get _decoration {
    return BoxDecorationUtility(
      (decoration) => BoxSpecAttribute(decoration: decoration),
    );
  }

  BorderRadiusGeometryUtility<BoxSpecAttribute> get radius {
    return _decoration.borderRadius;
  }
}
