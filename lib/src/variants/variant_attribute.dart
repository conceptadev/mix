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
}
