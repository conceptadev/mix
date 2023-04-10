import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../factory/style_mix.dart';
import 'context_variant.dart';
import 'variant.dart';

class VariantAttribute<T extends StyleVariant> extends StyleAttribute
    with Mergeable<VariantAttribute<T>> {
  const VariantAttribute(
    this.variant,
    StyleMix style,
  ) : _style = style;

  final T variant;
  final StyleMix _style;

  StyleMix get value => _style;

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
      _style.merge(other._style),
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
  int get hashCode => variant.hashCode ^ _style.hashCode;

  @override
  get props => [variant, value];
}

class ContextVariantAttribute extends VariantAttribute<ContextStyleVariant> {
  const ContextVariantAttribute(
    super.variant,
    super.style,
  );

  bool shouldApply(BuildContext context) {
    return variant.shouldApply.call(context);
  }
}
