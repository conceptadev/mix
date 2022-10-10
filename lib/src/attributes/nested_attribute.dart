import 'package:flutter/foundation.dart';
import 'package:mix/src/attributes/attribute.dart';

/// Allows to pass down Mixes as attributes for use with helpers
class NestedAttribute<T extends Attribute> extends Attribute {
  const NestedAttribute(this.attributes);

  final List<T> attributes;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NestedAttribute<T> &&
        listEquals(other.attributes, attributes);
  }

  @override
  int get hashCode => attributes.hashCode;
}
