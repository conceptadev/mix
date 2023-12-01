import 'package:flutter/material.dart';

import '../../theme/tokens/space_token.dart';
import '../scalars/scalar_util.dart';
import 'spacing_dto.dart';

/// A utility class for defining spacing attributes like padding and margin in Flutter widgets.
///
/// This class provides a convenient and intuitive way to specify various types of spacing in UI components.
/// It works with `SpacingAttribute` to create custom spacing attributes that can be applied to widgets.
///
/// Example:
/// ```dart
///   // Instantiate SpacingGeometryUtility with a custom SpacingAttributeBuilder.
///   final spacing = SpacingGeometryUtility(SpacingAttribute.new);
///
///   // Apply uniform spacing of 10 units on all sides.
///   final uniformSpacing = spacing.all(10);
///
///   // Apply different spacing values for each side.
///   final customSpacing = spacing.only(top: 10, bottom: 20, left: 30, right: 40);
///
///   // Apply 15 units of vertical and 20 units of horizontal spacing.
///   final verticalSpacing = spacing.vertical(15);
///   final horizontalSpacing = spacing.horizontal(20);
/// ```
@immutable
abstract class SpacingUtility<T>
    extends DtoUtility<T, SpacingDto, EdgeInsetsGeometry> {
  const SpacingUtility(super.builder) : super(dtoBuilder: SpacingDto.from);

  /// Private helper methods to simplify the creation of SpacingAttribute with utility functions.
  T _all(double value) =>
      only(top: value, bottom: value, left: value, right: value);
  T _top(double value) => only(top: value);
  T _bottom(double value) => only(bottom: value);
  T _left(double value) => only(left: value);
  T _right(double value) => only(right: value);
  T _start(double value) => only(start: value);
  T _end(double value) => only(end: value);

  T _horizontal(double value) => only(left: value, right: value);
  T _vertical(double value) => only(top: value, bottom: value);

  //  Methods for creating attributes with uniform values for specific orientations or directions.

  SpacingDirectionalUtility<T> get directional =>
      SpacingDirectionalUtility(builder);

  /// Applies uniform horizontal spacing to the widget.
  ///
  /// This method is useful for setting equal spacing on the left and right sides of a widget.
  ///
  /// Example:
  /// ```dart
  /// final myHorizontalPadding = spacing.horizontal(15);
  /// ```
  SpacingSideUtility<T> get horizontal => SpacingSideUtility(_horizontal);

  /// Applies uniform vertical spacing to the widget.
  ///
  /// Use this method when you want equal spacing on the top and bottom sides of a widget.
  ///
  /// Example:
  /// ```dart
  /// final myVerticalPadding = spacing.vertical(20);
  /// ```
  SpacingSideUtility<T> get vertical => SpacingSideUtility(_vertical);

  /// Applies uniform spacing to all sides of the widget.
  ///
  /// Use this method when you want equal spacing on all sides of a widget.
  ///
  /// Example:
  /// ```dart
  /// final myUniformPadding = spacing.all(10);
  /// ```
  SpacingSideUtility<T> get all => SpacingSideUtility(_all);

  /// Applies spacing to the top side of the widget.
  ///
  /// Use this method to add padding or margin to the top edge of a widget.
  ///
  /// Example:
  /// ```dart
  /// final myTopPadding = spacing.top(5);
  /// ```
  SpacingSideUtility<T> get top => SpacingSideUtility(_top);

  /// Applies spacing to the bottom side of the widget.
  ///
  /// Use this method to add padding or margin to the bottom edge of a widget.
  ///
  /// Example:
  /// ```dart
  /// final myBottomPadding = spacing.bottom(5);
  /// ```
  SpacingSideUtility<T> get bottom => SpacingSideUtility(_bottom);

  /// Applies spacing to the left side of the widget.
  ///
  /// Ideal for adding padding or margin to the left edge of a widget.
  ///
  /// Example:
  /// ```dart
  /// final myLeftPadding = spacing.left(8);
  /// ```
  SpacingSideUtility<T> get left => SpacingSideUtility(_left);

  /// Applies spacing to the right side of the widget.
  ///
  /// Use this method for padding or margin on the right edge of a widget.
  ///
  /// Example:
  /// ```dart
  /// final myRightPadding = spacing.right(8);
  /// ```
  SpacingSideUtility<T> get right => SpacingSideUtility(_right);

  /// Applies spacing to the start side of the widget (considering text direction).
  ///
  /// This method is particularly useful in RTL (Right-to-Left) layouts.
  ///
  /// Example:
  /// ```dart
  /// final myStartPadding = spacing.start(10);
  /// ```
  SpacingSideUtility<T> get start => SpacingSideUtility(_start);

  /// Applies spacing to the end side of the widget (considering text direction).
  ///
  /// This is helpful in RTL layouts for padding or margin on the end side of a widget.
  ///
  /// Example:
  /// ```dart
  /// final myEndPadding = spacing.end(10);
  /// ```
  SpacingSideUtility<T> get end => SpacingSideUtility(_end);

  /// Provides a method to create an attribute with custom values for each side.
  ///
  /// Use this method when you want to be explicit about the spacing values for each side.
  /// Method also allows for specifying directional spacing (e.g., `start` and `end`). and non-directional
  /// spacing (e.g., `left` and `right`) in the same attribute.
  T only({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  }) {
    return builder(
      SpacingDto(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        start: start,
        end: end,
      ),
    );
  }

  /// Callable method for creating space attributes with flexible parameter input.
  ///
  /// This method allows defining space by passing up to four parameters. The behavior is as follows:
  /// - 1 parameter: uniform spacing on all sides.
  /// - 2 parameters: first for top and bottom, second for left and right.
  /// - 3 parameters: first for top, second for left and right, third for bottom.
  /// - 4 parameters: applied to top, right, bottom, and left respectively.
  ///
  /// Examples:
  /// - `spacing(10)`: uniform spacing of 10 units on all sides.
  /// - `spacing(10, 20)`: top and bottom spacing of 10 units, left and right spacing of 20 units.
  /// - `spacing(10, 20, 30)`: top spacing of 10 units, left and right spacing of 20 units, bottom spacing of 30 units.
  /// - `spacing(10, 20, 30, 40)`: top spacing of 10 units, right spacing of 20 units, bottom spacing of 30 units, left spacing of 40 units.
  T call(double p1, [double? p2, double? p3, double? p4]) {
    double top = p1;
    double bottom = p1;
    double left = p1;
    double right = p1;

    if (p2 != null) {
      left = p2;
      right = p2;
    }

    if (p3 != null) bottom = p3;
    if (p4 != null) left = p4;

    return only(top: top, bottom: bottom, left: left, right: right);
  }
}

// Helper class to wrap functions that can return
// Space tokens in their methods
@immutable
class SpacingSideUtility<T> extends MixUtility<T, double> {
  const SpacingSideUtility(super.builder);

  T xsmall() => builder(SpaceToken.xsmall());

  T small() => builder(SpaceToken.small());

  T medium() => builder(SpaceToken.medium());

  T large() => builder(SpaceToken.large());

  T xlarge() => builder(SpaceToken.xlarge());

  T xxlarge() => builder(SpaceToken.xxlarge());

  T call(double value) => builder(value);
}

/// A utility class for creating directional spacing attributes in Flutter widgets.
///
/// `SpacingDirectionalUtility` is tailored for managing spacing attributes with directional properties,
/// such as `start` and `end`, in place of traditional `left` and `right`. This is especially beneficial
/// for layouts that need to support different writing directions (e.g., RTL - Right To Left). It works
/// in conjunction with `SpaceDirectionalAttribute` to apply directional spacing in a readable and
/// maintainable manner.
///
/// Example:
/// ```dart
///   // Instantiate SpacingDirectionalUtility with a custom SpacingAttributeBuilder.
///   final directionalSpacing = SpacingDirectionalUtility(SpacingAttribute.new);
///
///   // Apply uniform spacing of 10 units on all directional sides.
///   final uniformDirectionalSpacing = directionalSpacing.all(10);
///
///   // Apply different spacing values for top, bottom, start, and end.
///   final customDirectionalSpacing = directionalSpacing.only(top: 10, bottom: 20, start: 30, end: 40);
///
///   // Apply 15 units of vertical and 20 units of horizontal directional spacing.
///   final verticalDirectionalSpacing = directionalSpacing.vertical(15);
///   final horizontalDirectionalSpacing = directionalSpacing.horizontal(20);
/// ```
@immutable
class SpacingDirectionalUtility<T> extends SpacingUtility<T> {
  const SpacingDirectionalUtility(super.builder);

  // Private helper methods to simplify the creation of SpacingAttribute with utility functions.
  @override
  T _all(double value) =>
      only(top: value, bottom: value, start: value, end: value);
  @override
  T _start(double value) => only(start: value);
  @override
  T _end(double value) => only(end: value);
  @override
  T _top(double value) => only(top: value);
  @override
  T _bottom(double value) => only(bottom: value);
  @override
  T _vertical(double value) => only(top: value, bottom: value);
  @override
  T _horizontal(double value) => only(start: value, end: value);

  /// Callable method for creating directional space attributes with flexible parameter input.
  ///
  /// Allows defining space by passing up to four parameters, representing top, bottom, start,
  /// and end spacing, respectively. Parameters are optional and default to the first parameter's value.
  @override
  T call(double p1, [double? p2, double? p3, double? p4]) {
    double top = p1;
    double bottom = p1;
    double start = p1;
    double end = p1;

    if (p2 != null) {
      start = p2;
      end = p2;
    }

    if (p3 != null) bottom = p3;

    if (p4 != null) start = p4;

    return only(top: top, bottom: bottom, start: start, end: end);
  }

  // Methods for creating attributes with uniform values for specific orientations or directions.

  /// Applies uniform spacing on all directional sides.
  @override
  SpacingSideUtility<T> get all => SpacingSideUtility(_all);

  /// Applies uniform spacing on start side.
  @override
  SpacingSideUtility<T> get start => SpacingSideUtility(_start);

  /// Applies uniform spacing on end side.
  @override
  SpacingSideUtility<T> get end => SpacingSideUtility(_end);

  /// Applies uniform spacing on top side.
  @override
  SpacingSideUtility<T> get top => SpacingSideUtility(_top);

  /// Applies uniform spacing on bottom side.
  @override
  SpacingSideUtility<T> get bottom => SpacingSideUtility(_bottom);

  /// Applies uniform spacing on top and bottom sides.
  @override
  SpacingSideUtility<T> get vertical => SpacingSideUtility(_vertical);

  /// Applies uniform spacing on left and right sides.
  @override
  SpacingSideUtility<T> get horizontal => SpacingSideUtility(_horizontal);
}
