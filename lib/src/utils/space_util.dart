import 'package:flutter/material.dart';

import '../attributes/edge_insets_attribute.dart';
import '../attributes/scalar_attribute.dart';
import '../attributes/space_attribute.dart';
import '../helpers/extensions/values_ext.dart';
import '../theme/tokens/space_token.dart';
import 'scalar_util.dart';

/// Predefined utility constants for creating padding attributes.
const padding = SpacingUtility(PaddingAttribute.new);
const paddingDirectional = SpacingDirectionalUtility(PaddingAttribute.new);

/// Predefined utility constants for creating margin attributes.
const margin = SpacingUtility(MarginAttribute.new);
const marginDirectional = SpacingDirectionalUtility(MarginAttribute.new);

const gap = WithSpacingTokens(GapAttribute.new);

/// A utility class for creating directional spacing attributes in Flutter widgets.
///
/// `SpaceDirectionalUtility` is tailored for managing spacing attributes with directional properties,
/// such as `start` and `end`, instead of traditional `left` and `right`. This is particularly useful
/// for supporting layouts with different writing directions (e.g., RTL - Right To Left). It works
/// in conjunction with `SpaceDirectionalAttribute` to apply directional spacing in a readable and
/// maintainable way.
///
/// Example Usage:
/// ```dart
///   // Applying uniform spacing on all directional sides of a widget:
///   final uniformDirectionalSpacing = SpaceDirectionalUtility(myDirectionalAttribute).all(10);
///
///   // Applying spacing with different values for top, bottom, start, and end:
///   final customDirectionalSpacing = SpaceDirectionalUtility(myDirectionalAttribute)
///                                   .only(top: 10, bottom: 20, start: 30, end: 40);
///
///   // Applying symmetrical spacing in vertical or horizontal directions:
///   final verticalDirectionalSpacing = SpaceDirectionalUtility(myDirectionalAttribute).vertical(15);
///   final horizontalDirectionalSpacing = SpaceDirectionalUtility(myDirectionalAttribute).horizontal(20);
///
///   // Using spacing tokens for predefined spacing values:
///   final smallDirectionalSpacing = SpaceDirectionalUtility(myDirectionalAttribute).small;
///   final largeDirectionalSpacing = SpaceDirectionalUtility(myDirectionalAttribute).large;
/// ```
@immutable
class SpacingDirectionalUtility<T extends SpacingAttribute>
    extends MixUtility<T, EdgeInsetsDirectionalDto> {
  /// Constructs a `SpaceDirectionalUtility` with a space attribute creation function.
  ///
  /// The constructor takes a function that returns a `SpaceDirectionalAttribute` derived instance.
  /// This allows for flexible and custom creation of directional space attributes.
  const SpacingDirectionalUtility(super.builder);

  /// Methods for creating attributes with uniform values for specific orientations or directions.
  ///
  /// These methods are convenient for applying uniform spacing directionally.
  WithSpacingTokens<T> get all => WithSpacingTokens(_all);
  WithSpacingTokens<T> get start => WithSpacingTokens(_start);
  WithSpacingTokens<T> get end => WithSpacingTokens(_end);
  WithSpacingTokens<T> get top => WithSpacingTokens(_top);
  WithSpacingTokens<T> get bottom => WithSpacingTokens(_bottom);
  WithSpacingTokens<T> get vertical => WithSpacingTokens(_vertical);
  WithSpacingTokens<T> get horizontal => WithSpacingTokens(_horizontal);

  /// Provides a method to create an attribute with custom values for each directional side.
  ///
  /// Useful when different space values are needed for top, bottom, start, and end.
  T only({double? top, double? bottom, double? start, double? end}) {
    final spacing = EdgeInsetsDirectionalDto(
      top: top,
      bottom: bottom,
      start: start,
      end: end,
    );

    return builder(spacing);
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

    return only(top: top, bottom: bottom, start: start, end: end);
  }

  // Private helper methods to simplify the creation of directional space attributes.
  T _all(double value) =>
      only(top: value, bottom: value, start: value, end: value);
  T _start(double value) => only(start: value);
  T _end(double value) => only(end: value);
  T _top(double value) => only(top: value);
  T _bottom(double value) => only(bottom: value);
  T _vertical(double value) => only(top: value, bottom: value);
  T _horizontal(double value) => only(start: value, end: value);
}

/// A utility class for creating spacing attributes in Flutter widgets.
///
/// `SpacingUtility` simplifies the process of defining spacing-related attributes such as padding and margin.
/// It provides a flexible and readable way to specify spacing in your UI components, making the layout design
/// more intuitive and maintainable. This utility works with `SpaceAttribute` to create spacing attributes
/// that can be easily applied to Flutter widgets.
///
/// Example Usage:
/// ```dart
///   // For applying uniform spacing (e.g., padding or margin) on all sides of a widget:
///   final uniformSpacing = SpacingUtility(mySpaceAttribute).all(10);
///
///   // For applying spacing with different values on each side of a widget:
///   final customSpacing = SpacingUtility(mySpaceAttribute).only(top: 10, bottom: 20, left: 30, right: 40);
///
///   // For applying symmetrical spacing vertically or horizontally:
///   final verticalSpacing = SpacingUtility(mySpaceAttribute).vertical(15);
///   final horizontalSpacing = SpacingUtility(mySpaceAttribute).horizontal(20);
///
///   // For applying spacing using predefined space tokens:
///   final smallSpacing = SpacingUtility(mySpaceAttribute).small;
///   final largeSpacing = SpacingUtility(mySpaceAttribute).large;
/// ```
@immutable
class SpacingUtility<T extends SpacingAttribute>
    extends MixUtility<T, EdgeInsetsGeometryDto> {
  /// Constructs a `SpacingUtility` instance with a specified space attribute creation function.
  ///
  /// This constructor takes a function that returns a `SpaceAttribute` derived instance, providing
  /// flexibility in defining custom space attributes.
  const SpacingUtility(super.builder);

  /// Methods for creating attributes with uniform values for specific orientations or sides.
  ///
  /// These methods offer a convenient way to apply uniform spacing in different directions.
  WithSpacingTokens<T> get vertical => WithSpacingTokens(_vertical);
  WithSpacingTokens<T> get horizontal => WithSpacingTokens(_horizontal);
  WithSpacingTokens<T> get all => WithSpacingTokens(_all);
  WithSpacingTokens<T> get top => WithSpacingTokens(_top);
  WithSpacingTokens<T> get bottom => WithSpacingTokens(_bottom);
  WithSpacingTokens<T> get left => WithSpacingTokens(_left);
  WithSpacingTokens<T> get right => WithSpacingTokens(_right);
  WithSpacingTokens<T> get start => WithSpacingTokens(_start);
  WithSpacingTokens<T> get end => WithSpacingTokens(_end);

  /// Provides a method to create an attribute with custom values for each side.
  ///
  /// Use this method when you need different space values for top, bottom, left, and right.
  T only({
    double? top,
    double? bottom,
    double? left,
    double? right,
    double? start,
    double? end,
  }) {
    assert((start == null && end == null) || (left == null && right == null),
        'Cannot provide both start/end and left/right values');

    if (start != null || end != null) {
      final spacing = EdgeInsetsDirectionalDto(
        top: top,
        bottom: bottom,
        start: start,
        end: end,
      );

      return builder(spacing);
    }
    final spacing = EdgeInsetsDto(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );

    return builder(spacing);
  }

  /// Factory method to create a `SpaceAttribute` from `EdgeInsets`.
  ///
  /// This method converts `EdgeInsets` to a corresponding `SpaceAttribute`, enabling the use of
  /// Flutter's built-in edge inset values for defining space.
  T as(EdgeInsetsGeometry edgeInsets) => builder(edgeInsets.toDto());

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

  // Private helper methods to simplify the creation of space attributes.
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
}

// Helper class to wrap functions that can return
// Space tokens in their methods
@immutable
class WithSpacingTokens<T> {
  final T Function(double value) _fn;

  const WithSpacingTokens(T Function(double value) fn) : _fn = fn;

  T xsmall() => call(SpaceToken.xsmall());

  T small() => call(SpaceToken.small());

  T medium() => call(SpaceToken.medium());

  T large() => call(SpaceToken.large());

  T xlarge() => call(SpaceToken.xlarge());

  T xxlarge() => call(SpaceToken.xxlarge());

  T call(double value) => _fn(value);
}
