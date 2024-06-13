import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../scalars/scalar_util.dart';
import 'shadow_dto.dart';

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
