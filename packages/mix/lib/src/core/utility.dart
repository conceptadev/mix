import 'package:flutter/widgets.dart';

import 'attribute.dart';

abstract class MixUtility<Attr extends Attribute, Value> {
  @protected
  final Attr Function(Value) build;

  const MixUtility(this.build);

  static T selfBuilder<T>(T value) => value;
}

abstract class ScalarUtility<Return extends Attribute, V>
    extends MixUtility<Return, V> {
  const ScalarUtility(super.build);

  Return call(V value) => build(value);
}

base class ListUtility<T extends Attribute, V> extends MixUtility<T, List<V>> {
  const ListUtility(super.build);

  T call(List<V> values) => build(values);
}

final class StringUtility<T extends Attribute>
    extends ScalarUtility<T, String> {
  const StringUtility(super.builder);
}

/// A utility class for creating [Attribute] instances from [double] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [double] values or custom [double] values.
final class DoubleUtility<T extends Attribute>
    extends ScalarUtility<T, double> {
  const DoubleUtility(super.builder);

  /// Creates an [Attribute] instance with a value of 0.
  T zero() => build(0);

  /// Creates an [Attribute] instance with a value of [double.infinity].
  T infinity() => build(double.infinity);
}

/// A utility class for creating [Attribute] instances from [int] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [int] values or custom [int] values.
final class IntUtility<T extends Attribute> extends ScalarUtility<T, int> {
  const IntUtility(super.builder);

  /// Creates an [Attribute] instance with a value of 0.
  T zero() => build(0);

  /// Creates an [Attribute] instance from a custom [int] value.
  @override
  T call(int value) => build(value);
}

/// A utility class for creating [Attribute] instances from [bool] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [bool] values or custom [bool] values.
final class BoolUtility<T extends Attribute> extends ScalarUtility<T, bool> {
  const BoolUtility(super.builder);

  /// Creates an [Attribute] instance with a value of `true`.
  T on() => build(true);

  /// Creates an [Attribute] instance with a value of `false`.
  T off() => build(false);
}

/// An abstract utility class for creating [Attribute] instances from [double] values representing sizes.
///
/// This class extends [DoubleUtility] and serves as a base for more specific sizing utilities.
abstract base class SizingUtility<T extends Attribute>
    extends ScalarUtility<T, double> {
  SizingUtility(super.builder);
}
