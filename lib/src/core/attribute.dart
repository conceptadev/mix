import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../helpers/compare_mixin.dart';

@immutable
abstract class Attribute with Comparable {
  const Attribute();
}

abstract class StyleAttribute extends Attribute {
  const StyleAttribute();

  // Type used for combining attributes
  Type get type;
}

abstract class Dto<Value> with Comparable, Resolvable<Value> {
  const Dto();
}

/// A mixin used when a [Dto] or [Attribute] can be resolved.
///
/// This mixin provides a `resolve` method that accepts a [MixData] object and returns a value of type [Value].
///
/// Classes that use this mixin should implement the `resolve` method to define the resolution logic.
///
/// Example usage:
///
/// ```dart
/// class MyClass with Resolvable<String> {
///   @override
///   String resolve(MixData mix) {
///     // Resolution logic goes here
///   }
/// }
/// ```
///
mixin Resolvable<Value> {
  Value resolve(MixData mix);
}

/// A mixin that provides the ability to merge with another object of the same type.
///
/// The `Mergeable` mixin defines a single method `merge` that takes another object
/// of the same type and returns a new object that represents the merged result.
///
/// This mixin is typically used by [Dto] or [Attribute] that
/// need to be merged with other instances of the same type.
///
/// Example usage:
/// ```dart
/// class MyClass with Mergeable<MyClass> {
///   int id;
///   String name;
///
///   MyClass merge(covariant MyClass other) {
///     return MyClass()
///       ..id = other.id ?? id
///       ..name = other.name ?? name;
///   }
/// }
/// ```
/// The `merge` method should be implemented by classes that mix in this mixin.
mixin Mergeable<T> {
  T merge(covariant T? other);
}

/// An abstract class representing a resolvable attribute.
///
/// This class extends the [StyleAttribute] class and provides a generic type [Self] and [Value].
/// The [Self] type represents the concrete implementation of the attribute, while the [Value] type represents the resolvable value.
abstract class ResolvableAttribute<Self, Value> extends StyleAttribute
    with Resolvable<Value>, Mergeable<Self> {
  const ResolvableAttribute();

  @override
  Self merge(covariant Self? other);

  @override
  Type get type => Self;
}

abstract class DtoAttribute<Self, D extends Dto<Value>, Value>
    extends StyleAttribute with Resolvable<Value>, Mergeable<Self> {
  final D value;
  const DtoAttribute(this.value);

  @override
  Value resolve(MixData mix) => value.resolve(mix);

  @override
  Type get type => Self;

  @override
  get props => [value];
}

mixin SingleChildRenderAttributeMixin<W extends RenderObjectWidget>
    on StyleAttribute {
  W build(MixData mix, Widget child);
}

mixin MultiChildRenderAttributeMixin<W extends MultiChildRenderObjectWidget>
    on StyleAttribute {
  W render(MixData mix, List<Widget> children);
}

@immutable
abstract class Spec<T extends Spec<T>> extends ThemeExtension<T>
    with Comparable, Mergeable<T> {
  const Spec();

  Duration lerpDuration(Duration a, Duration b, double t) {
    int lerpTicks = ((1 - t) * a.inMilliseconds + t * b.inMilliseconds).round();

    return Duration(milliseconds: lerpTicks);
  }

  int lerpInt(int a, int b, double t) {
    return ((1 - t) * a + t * b).round();
  }

  N? genericNumLerp<N extends num>(N? a, N? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b;
    if (b == null) return a;

    return (a * (1 - t) + b * t) as N;
  }

  P lerpSnap<P>(P from, P to, double t) {
    return t < 0.5 ? from : to;
  }
}
