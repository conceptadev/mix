import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../mixer/mix_factory.dart';
import 'context_variant.dart';
import 'variant.dart';

class ContextVariantAttribute extends VariantAttribute<ContextVariant> {
  const ContextVariantAttribute(ContextVariant variant, MixFactory mix)
      : super(variant, mix);

  bool shouldApply(BuildContext context) {
    return variant.shouldApply.call(context);
  }
}

class VariantAttribute<T extends Variant> extends Attribute {
  const VariantAttribute(this.variant, MixFactory mix) : _mix = mix;

  final T variant;
  final MixFactory _mix;

  MixFactory get value => _mix;

  @override
  String toString() => 'VariantAttribute(variant: $variant, mix: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VariantAttribute &&
        other.variant == variant &&
        other.value == value;
  }

  @override
  int get hashCode => variant.hashCode ^ _mix.hashCode;
}
