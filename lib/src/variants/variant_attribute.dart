import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../factory/mix_factory.dart';
import 'context_variant.dart';
import 'variant.dart';

class VariantAttribute<T extends Variant> extends Attribute
    with MergeableMixin<VariantAttribute<T>> {
  const VariantAttribute(
    this.variant,
    Mix mix,
  ) : _mix = mix;

  final T variant;
  final Mix _mix;

  Mix get value => _mix;

  @override
  VariantAttribute<T> merge(covariant VariantAttribute<T> other) {
    if (other.variant != variant) {
      throw ArgumentError.value(
        other,
        'other',
        'VariantAttribute must have the same variant',
      );
    }

    return VariantAttribute(
      variant,
      _mix.merge(other._mix),
    );
  }

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

class ContextVariantAttribute extends VariantAttribute<ContextVariant> {
  const ContextVariantAttribute(
    ContextVariant variant,
    Mix mix,
  ) : super(
          variant,
          mix,
        );

  bool shouldApply(BuildContext context) {
    return variant.shouldApply.call(context);
  }
}
