import 'package:flutter/foundation.dart';
import 'attribute.dart';

/// Allows to pass down Mixes as attributes for use with helpers
class NestedAttribute<T extends Attribute> extends Attribute {
  const NestedAttribute(List<T> attributes) : _attributes = attributes;

  final List<T> _attributes;

  List<T> get values {
    return _attributes;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NestedAttribute<T> && listEquals(other.values, values);
  }

  @override
  int get hashCode => values.hashCode;
}
