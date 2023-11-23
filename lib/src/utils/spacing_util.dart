import 'package:flutter/material.dart';

import '../attributes/render/spacing_attribute.dart';
import '../theme/tokens/space_token.dart';
import 'scalar_util.dart';

/// Predefined utility constants for creating padding attributes.
const padding = SpacingGeometryUtility(PaddingAttribute.new);
const paddingDirectional = SpacingDirectionalUtility(PaddingAttribute.new);

/// Predefined utility constants for creating margin attributes.
const margin = SpacingGeometryUtility(MarginAttribute.new);
const marginDirectional = SpacingDirectionalUtility(MarginAttribute.new);

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
class SpacingGeometryUtility<T extends SpacingAttribute> {
  final SpacingAttributeBuilder<T> builder;

  const SpacingGeometryUtility(this.builder);

  /// Private helper methods to simplify the creation of SpacingAttribute with utility functions.
  T _all(double value) =>
      only(bottom: value, left: value, right: value, top: value);
  T _top(double value) => only(top: value);
  T _bottom(double value) => only(bottom: value);
  T _left(double value) => only(left: value);
  T _right(double value) => only(right: value);
  T _start(double value) => only(start: value);
  T _end(double value) => only(end: value);

  T _horizontal(double value) => only(left: value, right: value);
  T _vertical(double value) => only(bottom: value, top: value);

  //  Methods for creating attributes with uniform values for specific orientations or directions.

  /// Applies uniform spacing on top and bottom sides.
  SpacingUtility<T> get vertical => SpacingUtility(_vertical);

  /// Applies uniform spacing on left and right sides.
  SpacingUtility<T> get horizontal => SpacingUtility(_horizontal);

  /// Applies uniform spacing on all sides.
  SpacingUtility<T> get all => SpacingUtility(_all);

  /// Applies uniform spacing on top side.
  SpacingUtility<T> get top => SpacingUtility(_top);

  /// Applies uniform spacing on bottom side.
  SpacingUtility<T> get bottom => SpacingUtility(_bottom);

  /// Applies uniform spacing on left side.
  SpacingUtility<T> get left => SpacingUtility(_left);

  /// Applies uniform spacing on right side.
  SpacingUtility<T> get right => SpacingUtility(_right);

  /// Applies uniform spacing on start side.
  SpacingUtility<T> get start => SpacingUtility(_start);

  /// Applies uniform spacing on end side.
  SpacingUtility<T> get end => SpacingUtility(_end);

  /// Provides a method to create an attribute with custom values for each side.
  ///
  /// Use this method when you want to be explicit about the spacing values for each side.
  SpacingAttributeBuilder<T> get only => builder;

  /// Creates a spacing attribute from an `EdgeInsetsGeometry` instance.
  T as(EdgeInsetsGeometry edgeInsets) {
    if (edgeInsets is EdgeInsets) {
      return only(
        bottom: edgeInsets.bottom,
        left: edgeInsets.left,
        right: edgeInsets.right,
        top: edgeInsets.top,
      );
    } else if (edgeInsets is EdgeInsetsDirectional) {
      return only(
        bottom: edgeInsets.bottom,
        end: edgeInsets.end,
        start: edgeInsets.start,
        top: edgeInsets.top,
      );
    }
    throw Exception(
      'Unsupported EdgeInsetsGeometry type: ${edgeInsets.runtimeType}',
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

    return only(bottom: bottom, left: left, right: right, top: top);
  }
}

// Helper class to wrap functions that can return
// Space tokens in their methods
@immutable
class SpacingUtility<T> extends ScalarUtility<T, double> {
  const SpacingUtility(super.builder);

  T xsmall() => call(SpaceToken.xsmall());

  T small() => call(SpaceToken.small());

  T medium() => call(SpaceToken.medium());

  T large() => call(SpaceToken.large());

  T xlarge() => call(SpaceToken.xlarge());

  T xxlarge() => call(SpaceToken.xxlarge());
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
class SpacingDirectionalUtility<T extends SpacingAttribute> {
  final SpacingAttributeBuilder<T> builder;

  const SpacingDirectionalUtility(this.builder);

  // Private helper methods to simplify the creation of SpacingAttribute with utility functions.
  T _all(double value) =>
      only(bottom: value, end: value, start: value, top: value);
  T _start(double value) => only(start: value);
  T _end(double value) => only(end: value);
  T _top(double value) => only(top: value);
  T _bottom(double value) => only(bottom: value);
  T _vertical(double value) => only(bottom: value, top: value);
  T _horizontal(double value) => only(end: value, start: value);

  // Methods for creating attributes with uniform values for specific orientations or directions.

  /// Applies uniform spacing on all directional sides.
  SpacingUtility<T> get all => SpacingUtility(_all);

  /// Applies uniform spacing on start side.
  SpacingUtility<T> get start => SpacingUtility(_start);

  /// Applies uniform spacing on end side.
  SpacingUtility<T> get end => SpacingUtility(_end);

  /// Applies uniform spacing on top side.
  SpacingUtility<T> get top => SpacingUtility(_top);

  /// Applies uniform spacing on bottom side.
  SpacingUtility<T> get bottom => SpacingUtility(_bottom);

  /// Applies uniform spacing on top and bottom sides.
  SpacingUtility<T> get vertical => SpacingUtility(_vertical);

  /// Applies uniform spacing on left and right sides.
  SpacingUtility<T> get horizontal => SpacingUtility(_horizontal);

  /// Provides a method to create an attribute with custom values for each side.
  /// Use this method when you want to be explicit about the spacing values for each side.
  SpacingAttributeBuilder<T> get only => builder;

  T as(EdgeInsetsGeometry edgeInsets) {
    if (edgeInsets is EdgeInsets) {
      return only(
        bottom: edgeInsets.bottom,
        end: edgeInsets.right,
        start: edgeInsets.left,
        top: edgeInsets.top,
      );
    } else if (edgeInsets is EdgeInsetsDirectional) {
      return only(
        bottom: edgeInsets.bottom,
        end: edgeInsets.end,
        start: edgeInsets.start,
        top: edgeInsets.top,
      );
    }
    throw Exception(
      'Unsupported EdgeInsetsGeometry type: ${edgeInsets.runtimeType}',
    );
  }

  /// Callable method for creating directional space attributes with flexible parameter input.
  ///
  /// Allows defining space by passing up to four parameters, representing top, bottom, start,
  /// and end spacing, respectively. Parameters are optional and default to the first parameter's value.
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

    return only(bottom: bottom, end: end, start: start, top: top);
  }
}
