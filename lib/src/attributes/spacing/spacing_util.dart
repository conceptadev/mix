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

  /// Applies uniform spacing on top and bottom sides.
  SpacingSideUtility<T> get vertical => SpacingSideUtility(_vertical);

  SpacingDirectionalUtility<T> get directional =>
      SpacingDirectionalUtility(builder);

  /// Applies uniform spacing on left and right sides.
  SpacingSideUtility<T> get horizontal => SpacingSideUtility(_horizontal);

  /// Applies uniform spacing on all sides.
  SpacingSideUtility<T> get all => SpacingSideUtility(_all);

  /// Applies uniform spacing on top side.
  SpacingSideUtility<T> get top => SpacingSideUtility(_top);

  /// Applies uniform spacing on bottom side.
  SpacingSideUtility<T> get bottom => SpacingSideUtility(_bottom);

  /// Applies uniform spacing on left side.
  SpacingSideUtility<T> get left => SpacingSideUtility(_left);

  /// Applies uniform spacing on right side.
  SpacingSideUtility<T> get right => SpacingSideUtility(_right);

  /// Applies uniform spacing on start side.
  SpacingSideUtility<T> get start => SpacingSideUtility(_start);

  /// Applies uniform spacing on end side.
  SpacingSideUtility<T> get end => SpacingSideUtility(_end);

  /// Provides a method to create an attribute with custom values for each side.
  ///
  /// Use this method when you want to be explicit about the spacing values for each side.
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
  /// This method allows defining space by passing up to four parameters, representing top, bottom,
  /// left, and right spacing, respectively. Parameters are optional and default to the first parameter's value.
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

  @override
  T from(EdgeInsetsGeometry value) {
    if (value is EdgeInsets) {
      return only(
        top: value.top,
        bottom: value.bottom,
        start: value.left,
        end: value.right,
      );
    } else if (value is EdgeInsetsDirectional) {
      return only(
        top: value.top,
        bottom: value.bottom,
        start: value.start,
        end: value.end,
      );
    }
    throw Exception(
      'Unsupported EdgeInsetsGeometry type: ${value.runtimeType}',
    );
  }

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
