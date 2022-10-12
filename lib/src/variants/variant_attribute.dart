import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../attributes/attribute.dart';
import 'variants.dart';

class VariantAttribute<T extends Attribute> extends Attribute {
  const VariantAttribute(this.variant, List<T> attributes)
      : _attributes = attributes;

  final Variant<T> variant;
  final List<T> _attributes;

  List<T> get values {
    return _attributes;
  }

  bool shouldApply(BuildContext context) {
    return variant.shouldApply?.call(context) ?? false;
  }

  @override
  String toString() =>
      'VariantAttribute(variant: $variant, attributes: $values)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VariantAttribute<T> &&
        other.variant == variant &&
        listEquals(other.values, values);
  }

  @override
  int get hashCode => variant.hashCode ^ _attributes.hashCode;
}
