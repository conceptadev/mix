import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/values_ext.dart';
import '../color/color_dto.dart';
import '../color/color_util.dart';
import '../scalars/scalar_util.dart';
import 'shadow_dto.dart';

/// Utility class for creating and manipulating attributes with [Shadow]
///
/// Allows setting of color, offset, and blur radius for a shadow. This class
/// provides a convenient way to configure and apply shadow effects to [T]
///
/// Accepts a builder function that returns [T] and takes a [ShadowDto] as a parameter.
///
/// Example usage:
///
/// ```dart
// final shadow = ShadowUtility<StyleAttribute>(builder);
// final attribute = shadow(
//   color: Colors.black,
//   offset: Offset(2.0, 2.0),
//   blurRadius: 4.0,
// );
/// ```
///
/// See also:
/// * [ShadowDto], the data transfer object for [Shadow]
/// * [MixUtility], the utility class that [ShadowUtility] extends
class ShadowUtility<T extends StyleAttribute> extends MixUtility<T, ShadowDto> {
  const ShadowUtility(super.builder);

  // Internal method to create a shadow with optional parameters.
  T _only({ColorDto? color, Offset? offset, double? blurRadius}) {
    final shadow = ShadowDto(
      blurRadius: blurRadius,
      color: color,
      offset: offset,
    );

    return builder(shadow);
  }

  /// Returns a [ColorUtility] for setting the color of the shadow.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final shadow = ShadowUtility<StyleAttribute>(builder);
  /// final attribute = shadow.color(Colors.black);
  /// ```
  ///
  /// Attribute now holds a [ShadowAttribute] with a [ShadowDto] that has a color value of `Colors.black`.
  ///
  /// See also:
  /// * [ColorUtility], the utility class for manipulating [Color]
  /// * [ColorDto], the data transfer object for [Color]
  ColorUtility<T> get color {
    return ColorUtility((color) => _only(color: color));
  }

  /// Returns an [OffsetUtility] for setting the offset of the shadow.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final shadow = ShadowUtility<StyleAttribute>(builder);
  /// final attribute = shadow.offset(Offset(2.0, 2.0));
  /// ```
  ///
  /// Attribute now holds a [ShadowAttribute] with a [ShadowDto] that has an offset value of `Offset(2.0, 2.0)`.
  ///
  /// See also:
  /// * [OffsetUtility], the utility class for manipulating [Offset]
  /// * [Offset], the data transfer object for [Offset]
  OffsetUtility<T> get offset {
    return OffsetUtility((offset) => _only(offset: offset));
  }

  /// Method to set the blur radius of the shadow.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final shadow = ShadowUtility<StyleAttribute>(builder);
  /// final attribute = shadow.blurRadius(4.0);
  /// ```
  ///
  /// Attribute now holds a [ShadowAttribute] with a [ShadowDto] that has a blur radius value of `4.0`.
  ///
  /// See also:
  /// * [DoubleUtility], the utility class for manipulating [double]
  T blurRadius(double blurRadius) => _only(blurRadius: blurRadius);

  /// Method to create a shadow with provided parameters.
  T call({Color? color, Offset? offset, double? blurRadius}) {
    return _only(
      color: color?.toDto(),
      offset: offset,
      blurRadius: blurRadius,
    );
  }
}

/// Utility class for creating and manipulating a list of [BoxShadow] attributes.
///
/// Allows for the creation of a list of box shadows, useful for applying multiple shadows to a single element.
class BoxShadowListUtility<T extends StyleAttribute>
    extends MixUtility<T, List<BoxShadowDto>> {
  const BoxShadowListUtility(super.builder);

  /// Method to create a list of box shadows from a list of [BoxShadow].
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final boxShadowList = BoxShadowListUtility<StyleAttribute>(builder);
  /// final attribute = boxShadowList([
  ///   BoxShadow(color: Colors.black, blurRadius: 4.0, offset: Offset(2.0, 2.0))
  /// ]);
  /// ```
  ///
  /// Attribute now holds a list of [BoxShadowAttribute] with corresponding [BoxShadowDto] values.
  T call(List<BoxShadow> shadows) {
    return builder(shadows.map(BoxShadowDto.from).toList());
  }
}

/// Utility class for creating and manipulating [BoxShadow] attributes.
///
/// Allows setting of color, offset, blur radius, and spread radius for a box shadow.
/// Useful for adding depth and elevation effects to Flutter widgets.
class BoxShadowUtility<T extends StyleAttribute>
    extends MixUtility<T, BoxShadowDto> {
  const BoxShadowUtility(super.builder);

  /// Returns a [ColorUtility] for setting the color of the box shadow.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final boxShadow = BoxShadowUtility<StyleAttribute>(builder);
  /// final attribute = boxShadow.color(Colors.black);
  /// ```
  ///
  /// Attribute now holds a [BoxShadowAttribute] with a [BoxShadowDto] that has a color value of `Colors.black`.
  ColorUtility<T> get color {
    return ColorUtility((color) => call(color: color));
  }

  /// Returns an [OffsetUtility] for setting the offset of the box shadow.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final boxShadow = BoxShadowUtility<StyleAttribute>(builder);
  /// final attribute = boxShadow.offset(Offset(2.0, 2.0));
  /// ```
  ///
  /// Attribute now holds a [BoxShadowAttribute] with a [BoxShadowDto] that has an offset value of `Offset(2.0, 2.0)`.
  OffsetUtility<T> get offset {
    return OffsetUtility((offset) => call(offset: offset));
  }

  /// Method to set the spread radius of the box shadow.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final boxShadow = BoxShadowUtility<StyleAttribute>(builder);
  /// final attribute = boxShadow.spreadRadius(1.0);
  /// ```
  ///
  /// Attribute now holds a [BoxShadowAttribute] with a [BoxShadowDto] that has a spread radius value of `1.0`.
  T spreadRadius(double spreadRadius) => call(spreadRadius: spreadRadius);

  /// Method to set the blur radius of the box shadow.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final boxShadow = BoxShadowUtility<StyleAttribute>(builder);
  /// final attribute = boxShadow.blurRadius(4.0);
  /// ```
  ///
  /// Attribute now holds a [BoxShadowAttribute] with a [BoxShadowDto] that has a blur radius value of `4.0`.
  T blurRadius(double blurRadius) => call(blurRadius: blurRadius);

  /// Method to create a box shadow with provided parameters.
  T call({
    ColorDto? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    final shadow = BoxShadowDto(
      color: color,
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );

    return builder(shadow);
  }
}

/// Utility class for setting elevation using predefined shadows.
///
/// Provides convenience methods for standard material design elevations. This class
/// simplifies the process of applying consistent elevation effects across the application.
class ElevationUtility<T extends StyleAttribute>
    extends MixUtility<T, List<BoxShadowDto>> {
  const ElevationUtility(super.builder);

  /// Method to set elevation based on material design standards.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final elevation = ElevationUtility<StyleAttribute>(builder);
  /// final attribute = elevation.two();
  /// ```
  ///
  /// Attribute now holds a list of [BoxShadowAttribute] corresponding to a material elevation of `2`.
  T call(int value) {
    assert(kElevationToShadow.containsKey(value), 'Invalid elevation value');

    return builder(kElevationToShadow[value]!.toDto());
  }

  // Convenience methods for common elevation values.
  T none() => call(0);
  T one() => call(1);
  T two() => call(2);
  T three() => call(3);
  T four() => call(4);
  T six() => call(6);
  T eight() => call(8);
  T nine() => call(9);
  T twelve() => call(12);
  T sixteen() => call(16);
  T twentyFour() => call(24);
}
