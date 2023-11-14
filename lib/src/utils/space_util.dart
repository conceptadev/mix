// ignore_for_file: avoid-shadowing

import 'package:flutter/material.dart';

import '../attributes/scalar_attribute.dart';
import '../attributes/space_attribute.dart';
import '../theme/tokens/space_token.dart';

/// Predefined utility constants for creating padding attributes.
const padding = SpaceUtility(PaddingAttribute.new);
const paddingDirectional =
    SpaceDirectionalUtility(PaddingDirectionalAttribute.new);

/// Predefined utility constants for creating margin attributes.
const margin = SpaceUtility(MarginAttribute.new);
const marginDirectional =
    SpaceDirectionalUtility(MarginDirectionalAttribute.new);

const gap = WithSpaceToken(GapAttribute.new);

/// Type definition for a function that creates space attributes.
typedef SpaceUtilityFn<T extends SpaceAttribute> = T Function({
  double? top,
  double? bottom,
  double? left,
  double? right,
});

// Type definition for a function that creates directional space attributes.
typedef SpaceDirectionalUtilityFn<T extends SpaceDirectionalAttribute> = T
    Function({double? top, double? bottom, double? start, double? end});

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
class SpaceDirectionalUtility<T extends SpaceDirectionalAttribute> {
  final SpaceDirectionalUtilityFn<T> fn;

  /// Constructs a `SpaceDirectionalUtility` with a space attribute creation function.
  ///
  /// The constructor takes a function that returns a `SpaceDirectionalAttribute` derived instance.
  /// This allows for flexible and custom creation of directional space attributes.
  const SpaceDirectionalUtility(this.fn);

  /// Provides a method to create an attribute with custom values for each directional side.
  ///
  /// Useful when different space values are needed for top, bottom, start, and end.
  SpaceDirectionalUtilityFn<T> get only => fn;

  /// Methods for creating attributes with uniform values for specific orientations or directions.
  ///
  /// These methods are convenient for applying uniform spacing directionally.
  WithSpaceToken<T> get all => WithSpaceToken(_all);
  WithSpaceToken<T> get start => WithSpaceToken(_start);
  WithSpaceToken<T> get end => WithSpaceToken(_end);
  WithSpaceToken<T> get top => WithSpaceToken(_top);
  WithSpaceToken<T> get bottom => WithSpaceToken(_bottom);
  WithSpaceToken<T> get vertical => WithSpaceToken(_vertical);
  WithSpaceToken<T> get horizontal => WithSpaceToken(_horizontal);

  /// Converts `EdgeInsetsDirectional` to a corresponding `SpaceDirectionalAttribute`.
  ///
  /// This method enables the use of Flutter's built-in directional edge insets for defining space.
  T from(EdgeInsetsDirectional edgeInsets) {
    return fn(
      bottom: edgeInsets.bottom,
      end: edgeInsets.end,
      start: edgeInsets.start,
      top: edgeInsets.top,
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

    return fn(bottom: bottom, end: end, start: start, top: top);
  }

  // Private helper methods to simplify the creation of directional space attributes.
  T _all(double value) =>
      fn(bottom: value, end: value, start: value, top: value);
  T _start(double value) => fn(start: value);
  T _end(double value) => fn(end: value);
  T _top(double value) => fn(top: value);
  T _bottom(double value) => fn(bottom: value);
  T _vertical(double value) => fn(bottom: value, top: value);
  T _horizontal(double value) => fn(end: value, start: value);
}

/// A utility class for creating spacing attributes in Flutter widgets.
///
/// `SpaceUtility` simplifies the process of defining spacing-related attributes such as padding and margin.
/// It provides a flexible and readable way to specify spacing in your UI components, making the layout design
/// more intuitive and maintainable. This utility works with `SpaceAttribute` to create spacing attributes
/// that can be easily applied to Flutter widgets.
///
/// Example Usage:
/// ```dart
///   // For applying uniform spacing (e.g., padding or margin) on all sides of a widget:
///   final uniformSpacing = SpaceUtility(mySpaceAttribute).all(10);
///
///   // For applying spacing with different values on each side of a widget:
///   final customSpacing = SpaceUtility(mySpaceAttribute).only(top: 10, bottom: 20, left: 30, right: 40);
///
///   // For applying symmetrical spacing vertically or horizontally:
///   final verticalSpacing = SpaceUtility(mySpaceAttribute).vertical(15);
///   final horizontalSpacing = SpaceUtility(mySpaceAttribute).horizontal(20);
///
///   // For applying spacing using predefined space tokens:
///   final smallSpacing = SpaceUtility(mySpaceAttribute).small;
///   final largeSpacing = SpaceUtility(mySpaceAttribute).large;
/// ```
@immutable
class SpaceUtility<T extends SpaceAttribute> {
  final SpaceUtilityFn<T> _fn;

  /// Constructs a `SpaceUtility` instance with a specified space attribute creation function.
  ///
  /// This constructor takes a function that returns a `SpaceAttribute` derived instance, providing
  /// flexibility in defining custom space attributes.
  const SpaceUtility(this._fn);

  /// Provides a method to create an attribute with custom values for each side.
  ///
  /// Use this method when you need different space values for top, bottom, left, and right.
  SpaceUtilityFn<T> get only => _fn;

  /// Methods for creating attributes with uniform values for specific orientations or sides.
  ///
  /// These methods offer a convenient way to apply uniform spacing in different directions.
  WithSpaceToken<T> get vertical => WithSpaceToken(_vertical);
  WithSpaceToken<T> get horizontal => WithSpaceToken(_horizontal);
  WithSpaceToken<T> get all => WithSpaceToken(_all);
  WithSpaceToken<T> get top => WithSpaceToken(_top);
  WithSpaceToken<T> get bottom => WithSpaceToken(_bottom);
  WithSpaceToken<T> get left => WithSpaceToken(_left);
  WithSpaceToken<T> get right => WithSpaceToken(_right);

  /// Factory method to create a `SpaceAttribute` from `EdgeInsets`.
  ///
  /// This method converts `EdgeInsets` to a corresponding `SpaceAttribute`, enabling the use of
  /// Flutter's built-in edge inset values for defining space.
  T from(EdgeInsets edgeInsets) {
    return _fn(
      bottom: edgeInsets.bottom,
      left: edgeInsets.left,
      right: edgeInsets.right,
      top: edgeInsets.top,
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

    return _fn(bottom: bottom, left: left, right: right, top: top);
  }

// Private helper methods to simplify the creation of space attributes.
  T _all(double value) =>
      _fn(bottom: value, left: value, right: value, top: value);
  T _top(double value) => _fn(top: value);
  T _bottom(double value) => _fn(bottom: value);
  T _left(double value) => _fn(left: value);
  T _right(double value) => _fn(right: value);

  T _horizontal(double value) => _fn(left: value, right: value);
  T _vertical(double value) => _fn(bottom: value, top: value);
}

// Helper class to wrap functions that can return
// Space tokens in their methods
@immutable
class WithSpaceToken<T> {
  final T Function(double value) _fn;

  const WithSpaceToken(T Function(double value) fn) : _fn = fn;

  T get xsmall => call(SpaceToken.xsmall());

  T get small => call(SpaceToken.small());

  T get medium => call(SpaceToken.medium());

  T get large => call(SpaceToken.large());

  T get xlarge => call(SpaceToken.xlarge());

  T get xxlarge => call(SpaceToken.xxlarge());

  T call(double value) => _fn(value);
}
