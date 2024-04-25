import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/values_ext.dart';
import '../color/color_dto.dart';
import '../color/color_util.dart';
import '../scalars/scalar_util.dart';
import 'shadow_dto.dart';

/// Utility class for working with box shadows.
///
/// This class provides a set of utilities for working with box shadows, including
/// creating and manipulating box shadow objects. It uses a builder pattern to
/// create new box shadow objects, and provides methods for setting the various
/// properties of a box shadow, such as color, offset, blur radius, and spread
/// radius.
///
/// The [BoxShadowUtility] class is part of a larger set of utilities for working
/// with style attributes in a Flutter application.
class BoxShadowUtility<T extends StyleAttribute>
    extends DtoUtility<T, BoxShadowDto, BoxShadow> {
  /// A utility for setting the color of a box shadow.
  late final color = ColorUtility<T>((v) => only(color: v));

  /// A utility for setting the offset of a box shadow.
  late final offset = OffsetUtility<T>((v) => call(offset: v));

  /// A utility for setting the blur radius of a box shadow.
  late final blurRadius = DoubleUtility<T>((v) => call(blurRadius: v));

  /// A utility for setting the spread radius of a box shadow.
  late final spreadRadius = DoubleUtility<T>((v) => call(spreadRadius: v));

  /// Creates a new [BoxShadowUtility] instance.
  BoxShadowUtility(super.builder) : super(valueToDto: BoxShadowDto.from);

  /// Creates a new box shadow with the specified properties.
  ///
  /// The [color], [offset], [blurRadius], and [spreadRadius] parameters are
  /// used to set the properties of the new box shadow.
  T call({
    Color? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return only(
      color: ColorDto.maybeFrom(color),
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );
  }

  /// Creates a new box shadow with the specified properties.
  ///
  /// This method is similar to the [call] method, but it allows you to specify
  /// the properties of the box shadow using named parameters.
  @override
  T only({
    ColorDto? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return builder(
      BoxShadowDto(
        color: color,
        offset: offset,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      ),
    );
  }
}

class ShadowUtility<T extends StyleAttribute>
    extends DtoUtility<T, ShadowDto, Shadow> {
  late final color = ColorUtility<T>((v) => only(color: v));
  late final offset = OffsetUtility<T>((v) => only(offset: v));

  ShadowUtility(super.builder) : super(valueToDto: ShadowDto.from);

  T blurRadius(double v) => only(blurRadius: v);

  T call({Color? color, Offset? offset, double? blurRadius}) {
    return only(
      color: ColorDto.maybeFrom(color),
      offset: offset,
      blurRadius: blurRadius,
    );
  }

  @override
  T only({ColorDto? color, Offset? offset, double? blurRadius}) {
    return builder(
      ShadowDto(blurRadius: blurRadius, color: color, offset: offset),
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

class BoxShadowListUtility<T extends StyleAttribute>
    extends MixUtility<T, List<BoxShadowDto>> {
  const BoxShadowListUtility(super.builder);

  T call(List<BoxShadow> shadows) {
    return builder(shadows.map(BoxShadowDto.from).toList());
  }
}

class ElevationUtility<T extends StyleAttribute>
    extends MixUtility<T, List<BoxShadowDto>> {
  const ElevationUtility(super.builder);

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
