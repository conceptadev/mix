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
typedef StyledAttribute = SpecAttribute;

@Deprecated('Use Mixable instead')
typedef Dto<Value> = Mixable<Value>;

abstract class Mixable<Value> extends StyleElement {
  const Mixable();

  Value resolve(MixData mix);

  @override
  Mixable<Value> merge(covariant Mixable<Value>? other);
}

// Define a mixin for properties that have default values
mixin HasDefaultValue<Value> {
  @protected
  Value get defaultValue;
}

abstract class DtoUtility<A extends Attribute, D extends Mixable<Value>, Value>
    extends MixUtility<A, D> {
  final D Function(Value) _fromValue;
  const DtoUtility(super.builder, {required D Function(Value) valueToDto})
      : _fromValue = valueToDto;

  A only();

  A as(Value value) => builder(_fromValue(value));
}

// /// Provides the ability to merge this object with another of the same type.
// ///
// /// Defines a single method, [merge], which takes another object of type [T]
// /// and returns a new object representing the merged result.
// ///
// /// Typically used by classes like [MixableDto] or [StyleAttribute] that need to merge
// /// instances of the same type.
// mixin MergeableMixin<T> {
//   /// Merges this object with [other], returning a new object of type [T].
//   T merge(covariant T? other);
//   // Used as the key to determine how
//   // attributes get merged
//   Object get mergeKey => runtimeType;
// }
