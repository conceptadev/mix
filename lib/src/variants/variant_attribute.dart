import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../factory/style_mix.dart';
import 'context_variant.dart';
import 'variant.dart';

class VariantAttribute<T extends Variant> extends StyleAttribute {
  final T variant;
  final StyleMix _style;

  const VariantAttribute(this.variant, StyleMix style) : _style = style;

  StyleMix get value => _style;

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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VariantAttribute &&
        other.variant == variant &&
        other.value == value;
  }

  @override
  Key get mergeKey => ValueKey(this.variant.name);

  @override
  int get hashCode => variant.hashCode ^ _style.hashCode;

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
