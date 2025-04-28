import 'package:flutter/widgets.dart';

import 'element.dart';

abstract class MixUtility<Attr extends Attribute, Value> {
  @protected
  final Attr Function(Value) builder;

  const MixUtility(this.builder);

  static T selfBuilder<T>(T value) => value;
}

class GenericUtility<Attr extends Attribute, Value>
    extends MixUtility<Attr, Value> {
  const GenericUtility(super.builder);

  Attr call(Value value) => builder(value);
}

abstract class ScalarUtility<Return extends Attribute, V>
    extends MixUtility<Return, V> {
  const ScalarUtility(super.builder);

  Return call(V value) => builder(value);
}

base class ListUtility<T extends Attribute, V> extends MixUtility<T, List<V>> {
  const ListUtility(super.builder);

  T call(List<V> values) => builder(values);
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
  T zero() => builder(0);

  /// Creates an [Attribute] instance with a value of [double.infinity].
  T infinity() => builder(double.infinity);
}

/// A utility class for creating [Attribute] instances from [int] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [int] values or custom [int] values.
final class IntUtility<T extends Attribute> extends ScalarUtility<T, int> {
  const IntUtility(super.builder);

  /// Creates an [Attribute] instance with a value of 0.
  T zero() => builder(0);

  /// Creates an [Attribute] instance from a custom [int] value.
  @override
  T call(int value) => builder(value);
}

/// A utility class for creating [Attribute] instances from [bool] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [bool] values or custom [bool] values.
final class BoolUtility<T extends Attribute> extends ScalarUtility<T, bool> {
  const BoolUtility(super.builder);

  /// Creates an [Attribute] instance with a value of `true`.
  T on() => builder(true);

  /// Creates an [Attribute] instance with a value of `false`.
  T off() => builder(false);
}

/// An abstract utility class for creating [Attribute] instances from [double] values representing sizes.
///
/// This class extends [DoubleUtility] and serves as a base for more specific sizing utilities.
abstract base class SizingUtility<T extends Attribute>
    extends ScalarUtility<T, double> {
  const SizingUtility(super.builder);
}
