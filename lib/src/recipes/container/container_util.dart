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
import '../../core/attribute.dart';
import '../../core/extensions/values_ext.dart';
import 'container_attribute.dart';

const container = ContainerUtility.selfBuilder;
const box = ContainerUtility.selfBuilder;

class ContainerUtility<T extends StyleAttribute>
    extends MixUtility<T, ContainerSpecAttribute> {
  static const selfBuilder = ContainerUtility(MixUtility.selfBuilder);
  const ContainerUtility(super.builder);

  T _only({
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
    return builder(
      ContainerSpecAttribute(
        alignment: alignment,
        padding: padding,
        margin: margin,
        constraints: constraints,
        decoration: decoration,
        transform: transform,
        clipBehavior: clipBehavior,
        width: width,
        height: height,
      ),
    );
  }

  DecorationUtility<T> get decoration {
    return DecorationUtility((decoration) => _only(decoration: decoration));
  }

  AlignmentUtility<T> get alignment {
    return AlignmentUtility((alignment) => call(alignment: alignment));
  }

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
  SpacingUtility<T> get padding {
    return SpacingUtility((padding) => _only(padding: padding));
  }

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
  SpacingUtility<T> get margin {
    return SpacingUtility((margin) => _only(margin: margin));
  }

  // We use BoxDecoration for better Decoration support to avoid weird issues
  ColorUtility<T> get color => decoration.box.color;

  ElevationUtility<T> get elevation => decoration.box.elevation;

  BoxConstraintsUtility<T> get constraints {
    return BoxConstraintsUtility(
      (constraints) => _only(constraints: constraints),
    );
  }

  Matrix4Utility<T> get transform {
    return Matrix4Utility((transform) => call(transform: transform));
  }

  ClipUtility<T> get clipBehavior {
    return ClipUtility((clipBehavior) => call(clipBehavior: clipBehavior));
  }

  ///  Decoration Utilities
  BoxBorderUtility<T> get border => decoration.box.border;

  BorderRadiusGeometryUtility<T> get borderRadius =>
      decoration.box.borderRadius;

  BoxShadowListUtility<T> get boxShadow => decoration.box.boxShadow;

  ///  Constraints utilities
  DoubleUtility<T> get maxWidth => constraints.maxWidth;

  DoubleUtility<T> get minWidth => constraints.minWidth;

  DoubleUtility<T> get maxHeight => constraints.maxHeight;

  DoubleUtility<T> get minHeight => constraints.minHeight;

  DoubleUtility<T> get width => DoubleUtility((width) => _only(width: width));

  DoubleUtility<T> get height =>
      DoubleUtility((height) => _only(height: height));

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
  }) {
    final attribute = ContainerSpecAttribute(
      alignment: alignment,
      padding: SpacingDto.maybeFrom(padding),
      margin: SpacingDto.maybeFrom(margin),
      constraints: constraints?.toDto(),
      decoration: decoration?.toDto(),
      transform: transform,
      clipBehavior: clipBehavior,
      width: width,
      height: height,
    );

    return builder(attribute);
  }
}
