import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/variants/variants.dart';

class VariantAttribute<T extends Attribute> extends Attribute {
  const VariantAttribute(
    this.variant,
    this.attributes, {
    bool Function(BuildContext)? shouldApply,
  }) : _shouldApply = shouldApply;

  final Variant<T> variant;
  final List<T> attributes;
  final bool Function(BuildContext)? _shouldApply;

  bool shouldApply(BuildContext context) {
    return _shouldApply?.call(context) ?? false;
  }

  @override
  String toString() =>
      'VariantAttribute(variant: $variant, attributes: $attributes)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VariantAttribute<T> &&
        other.variant == variant &&
        listEquals(other.attributes, attributes) &&
        other._shouldApply == _shouldApply;
  }

  @override
  int get hashCode =>
      variant.hashCode ^ attributes.hashCode ^ _shouldApply.hashCode;
}
