import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../core/variants/context_variant.dart';
import '../core/variants/variant.dart';
import '../factory/exports.dart';

class VariantAttribute<T extends Variant> extends Attribute<T> {
  final T variant;
  final StyleMix _style;

  const VariantAttribute(this.variant, StyleMix style) : _style = style;

  MixValues get value => _style.values;

  @override
  VariantAttribute<T> merge(covariant VariantAttribute<T> other) {
    if (other.variant != variant) {
      throw throwArgumentError(other);
    }

    return VariantAttribute(variant, _style.merge(other._style));
  }

  @override
  String toString() => 'VariantAttribute(variant: $variant, mix: $value)';

  @override
  Key get mergeKey => ValueKey(this.variant.name);

  @override
  get props => [variant, value];
}

class ContextVariantAttribute extends VariantAttribute<ContextVariant> {
  const ContextVariantAttribute(super.variant, super.style);

  bool shouldApply(BuildContext context) {
    return variant.shouldApply(context);
  }

  @override
  ContextVariantAttribute merge(ContextVariantAttribute other) {
    if (other.variant != variant) {
      throw throwArgumentError(other);
    }

    return ContextVariantAttribute(variant, _style.merge(other._style));
  }
}

ArgumentError throwArgumentError<T extends VariantAttribute>(T other) {
  throw ArgumentError.value(
    other.runtimeType,
    'other',
    'VariantAttribute must have the same variant',
  );
}
