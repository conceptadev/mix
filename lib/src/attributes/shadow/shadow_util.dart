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
      color: ColorDto.maybeFrom(color),
      offset: offset,
      blurRadius: blurRadius,
    );
  }
}

class ShadowListUtility<T extends StyleAttribute>
    extends MixUtility<T, List<ShadowDto>> {
  const ShadowListUtility(super.builder);

  T call(List<BoxShadow> shadows) {
    return builder(shadows.map(ShadowDto.from).toList());
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
    extends DtoUtility<T, BoxShadowDto, BoxShadow> {
  const BoxShadowUtility(super.builder) : super(valueToDto: BoxShadowDto.from);

  T _only({
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
    return ColorUtility((color) => _only(color: color));
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
  DoubleUtility<T> get blurRadius {
    return DoubleUtility((blurRadius) => call(blurRadius: blurRadius));
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
  DoubleUtility<T> get spreadRadius {
    return DoubleUtility((spreadRadius) => call(spreadRadius: spreadRadius));
  }

  /// Method to create a box shadow with provided parameters.
  T call({
    Color? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return _only(
      color: ColorDto.maybeFrom(color),
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );
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
  /// You can pass 0, 1, 2, 3, 4, 6, 8, 9, 12, 16, 24 to this method.
  T call(int value) {
    assert(kElevationToShadow.containsKey(value), 'Invalid elevation value');

    return builder(kElevationToShadow[value]!.toDto());
  }

  // Convenience methods for common elevation values.

  @Deprecated('Use pass int value to call() instead')
  T none() => call(0);

  @Deprecated('Use pass int value to call() instead')
  T one() => call(1);

  @Deprecated('Use pass int value to call() instead')
  T two() => call(2);

  @Deprecated('Use pass int value to call() instead')
  T three() => call(3);

  @Deprecated('Use pass int value to call() instead')
  T four() => call(4);

  @Deprecated('Use pass int value to call() instead')
  T six() => call(6);

  @Deprecated('Use pass int value to call() instead')
  T eight() => call(8);

  @Deprecated('Use pass int value to call() instead')
  T nine() => call(9);

  @Deprecated('Use pass int value to call() instead')
  T twelve() => call(12);

  @Deprecated('Use pass int value to call() instead')
  T sixteen() => call(16);

  @Deprecated('Use pass int value to call() instead')
  T twentyFour() => call(24);
}
