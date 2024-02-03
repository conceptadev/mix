import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import '../helpers/compare_mixin.dart';

@immutable
abstract class Attribute with Comparable {
  const Attribute();

  // Used as a merge type
  Object get type;

  // Used to determine if the attribute is inheritable
  bool get isInheritable => true;
}

@immutable
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

@immutable
abstract class StyleAttribute extends Attribute {
  const StyleAttribute();
}

/// An abstract class representing a resolvable attribute.
///
/// This class extends the [StyleAttribute] class and provides a generic type [Self] and [Value].
/// The [Self] type represents the concrete implementation of the attribute, while the [Value] type represents the resolvable value.
abstract class SpecAttribute<Self, Value> extends StyleAttribute
    with Resolvable<Value>, Mergeable<Self> {
  const SpecAttribute();

  @override
  Self merge(Self? other);

  @override
  Type get type => Self;
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
    with Comparable {
  const Spec();
}
