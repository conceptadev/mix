import 'package:flutter/foundation.dart';

import '../internal/compare_mixin.dart';
import 'factory/mix_data.dart';
import 'spec.dart';
import 'utility.dart';

abstract class StyleElement with EqualityMixin {
  const StyleElement();

  // Used as the key to determine how
  // attributes get merged
  Object get mergeKey => runtimeType;

  /// Merges this object with [other], returning a new object of type [T].
  StyleElement merge(covariant StyleElement? other);
}

/// Similar to a StyleElement but can be passed as an attribute of `Style`
abstract class Attribute extends StyleElement {
  const Attribute();
}

@Deprecated('Use StyleAttribute instead')
typedef StyledAttribute = StyleAttribute;

@Deprecated('Use StyleAttribute instead')
typedef SpecAttribute<Value> = StyleAttribute<Value>;

@Deprecated('Use StyleProperty instead')
typedef Dto<Value> = StyleProperty<Value>;

abstract class StyleProperty<Value> extends StyleElement {
  const StyleProperty();

  Value resolve(MixData mix);
}

// Define a mixin for properties that have default values
mixin HasDefaultValue<Value> on StyleProperty<Value> {
  @protected
  Value get defaultValue;
}

abstract class DtoUtility<A extends Attribute, D extends StyleProperty<Value>,
    Value> extends MixUtility<A, D> {
  final D Function(Value) _fromValue;
  DtoUtility(super.builder, {required D Function(Value) valueToDto})
      : _fromValue = valueToDto;

  A only();

  A as(Value value) => builder(_fromValue(value));
}

// /// Provides the ability to merge this object with another of the same type.
// ///
// /// Defines a single method, [merge], which takes another object of type [T]
// /// and returns a new object representing the merged result.
// ///
// /// Typically used by classes like [StylePropertyDto] or [StyleAttribute] that need to merge
// /// instances of the same type.
// mixin MergeableMixin<T> {
//   /// Merges this object with [other], returning a new object of type [T].
//   T merge(covariant T? other);
//   // Used as the key to determine how
//   // attributes get merged
//   Object get mergeKey => runtimeType;
// }
