import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../mixer/mix_factory.dart';
import 'variants.dart';

class VariantAttribute<T extends Attribute> extends Attribute {
  const VariantAttribute(this.variant, Mix mix) : _mix = mix;

  final Variant<T> variant;
  final Mix _mix;

  Mix get value => _mix;

  bool shouldApply(BuildContext context) {
    return variant.shouldApply?.call(context) ?? false;
  }

  @override
  String toString() => 'VariantAttribute(variant: $variant, mix: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VariantAttribute<T> &&
        other.variant == variant &&
        other.value == value;
  }

  @override
  int get hashCode => variant.hashCode ^ _mix.hashCode;
}
