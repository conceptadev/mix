import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../color/color_dto.dart';
import '../color/color_util.dart';
import '../scalars/scalar_util.dart';
import 'shadow_dto.dart';

/// A utility class for working with [BoxShadow] attributes.
///
/// This class provides methods to create and modify [BoxShadow] instances
/// using a fluent API.
final class BoxShadowUtility<T extends Attribute>
    extends DtoUtility<T, BoxShadowDto, BoxShadow> {
  /// A utility for setting the [BoxShadow.color] property.
  late final color = ColorUtility<T>((v) => only(color: v));

  /// A utility for setting the [BoxShadow.offset] property.
  late final offset = OffsetUtility<T>((v) => call(offset: v));

  /// A utility for setting the [BoxShadow.blurRadius] property.
  late final blurRadius = DoubleUtility<T>((v) => call(blurRadius: v));

  /// A utility for setting the [BoxShadow.spreadRadius] property.
  late final spreadRadius = DoubleUtility<T>((v) => call(spreadRadius: v));

  /// Creates a new [BoxShadowUtility] instance.
  ///
  /// The [builder] function is used to create new instances of [T].
  BoxShadowUtility(super.builder) : super(valueToDto: (value) => value.toDto());

  /// Creates a new [Attribute] with the specified properties.
  ///
  /// Any properties not specified will retain their current values.
  T call({
    Color? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return only(
      color: color?.toDto(),
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );
  }

  /// Creates a new [Attribute] with the specified properties.
  ///
  /// Any properties not specified will be set to their default values.
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

/// A utility class for working with [Shadow] attributes.
///
/// This class provides methods to create and modify [Shadow] instances
/// using a fluent API.
final class ShadowUtility<T extends Attribute>
    extends DtoUtility<T, ShadowDto, Shadow> {
  /// A utility for setting the [Shadow.color] property.
  late final color = ColorUtility<T>((v) => only(color: v));

  /// A utility for setting the [Shadow.offset] property.
  late final offset = OffsetUtility<T>((v) => only(offset: v));

  /// Creates a new [ShadowUtility] instance.
  ///
  /// The [builder] function is used to create new instances of [T].
  ShadowUtility(super.builder) : super(valueToDto: (value) => value.toDto());

  /// Sets the [Shadow.blurRadius] property.
  ///
  /// Returns a new [Attribute] with the updated property.
  T blurRadius(double v) => only(blurRadius: v);

  /// Creates a new [Attribute] with the specified properties.
  ///
  /// Any properties not specified will retain their current values.
  T call({Color? color, Offset? offset, double? blurRadius}) {
    return only(
      color: color?.toDto(),
      offset: offset,
      blurRadius: blurRadius,
    );
  }

  /// Creates a new [Attribute] with the specified properties.
  ///
  /// Any properties not specified will be set to their default values.
  @override
  T only({ColorDto? color, Offset? offset, double? blurRadius}) {
    return builder(
      ShadowDto(blurRadius: blurRadius, color: color, offset: offset),
    );
  }
}

/// A utility class for building [Attribute] instances from a list of [ShadowDto] objects.
///
/// This class extends [MixUtility] and provides a convenient way to create [Attribute]
/// instances by transforming a list of [BoxShadow] objects into a list of [ShadowDto] objects.
final class ShadowListUtility<T extends Attribute>
    extends MixUtility<T, List<ShadowDto>> {
  const ShadowListUtility(super.builder);

  /// Creates an [Attribute] instance from a list of [BoxShadow] objects.
  ///
  /// This method maps each [BoxShadow] object to a [ShadowDto] object and passes the
  /// resulting list to the [builder] function to create the [Attribute] instance.
  T call(List<Shadow> shadows) {
    return builder(shadows.map((e) => e.toDto()).toList());
  }
}

/// A utility class for building [Attribute] instances from a list of [BoxShadowDto] objects.
///
/// This class extends [MixUtility] and provides a convenient way to create [Attribute]
/// instances by transforming a list of [BoxShadow] objects into a list of [BoxShadowDto] objects.
final class BoxShadowListUtility<T extends Attribute>
    extends MixUtility<T, List<BoxShadowDto>> {
  const BoxShadowListUtility(super.builder);

  /// Creates an [Attribute] instance from a list of [BoxShadow] objects.
  ///
  /// This method maps each [BoxShadow] object to a [BoxShadowDto] object and passes the
  /// resulting list to the [builder] function to create the [Attribute] instance.
  T call(List<BoxShadow> shadows) {
    return builder(shadows.map((e) => e.toDto()).toList());
  }
}

/// A utility class for building [Attribute] instances from elevation values.
///
/// This class extends [MixUtility] and provides methods to create [Attribute] instances
/// based on predefined elevation values, which are mapped to corresponding lists of
/// [BoxShadowDto] objects using the [kElevationToShadow] map.
final class ElevationUtility<T extends Attribute>
    extends MixUtility<T, List<BoxShadowDto>> {
  const ElevationUtility(super.builder);

  /// Creates an [Attribute] instance from an elevation value.
  ///
  /// Retrieves the corresponding list of [BoxShadow] objects from the [kElevationToShadow]
  /// map, maps each [BoxShadow] to a [BoxShadowDto], and passes the resulting list to
  /// the [builder] function to create the [Attribute] instance.
  ///
  /// Throws an [AssertionError] if the provided [value] is not a valid elevation value.
  T call(int value) {
    assert(kElevationToShadow.containsKey(value), 'Invalid elevation value');

    final boxShadows = kElevationToShadow[value]!.map((e) => e.toDto());

    return builder(boxShadows.toList());
  }

  /// Creates an [T] instance with no elevation.
  T none() => call(0);

  /// Creates an [T] instance with an elevation of 1.
  T one() => call(1);

  /// Creates an [T] instance with an elevation of 2.
  T two() => call(2);

  /// Creates an [T] instance with an elevation of 3.
  T three() => call(3);

  /// Creates an [T] instance with an elevation of 4.
  T four() => call(4);

  /// Creates an [T] instance with an elevation of 6.
  T six() => call(6);

  /// Creates an [T] instance with an elevation of 8.
  T eight() => call(8);

  /// Creates an [T] instance with an elevation of 9.
  T nine() => call(9);

  /// Creates an [T] instance with an elevation of 12.
  T twelve() => call(12);

  /// Creates an [T] instance with an elevation of 16.
  T sixteen() => call(16);

  /// Creates an [T] instance with an elevation of 24.
  T twentyFour() => call(24);
}
