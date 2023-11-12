import 'package:flutter/material.dart';

import '../factory/style_mix.dart';
import '../variants/context_variant.dart';
import '../variants/variant.dart';
import 'attribute.dart';

@immutable
class VariantAttribute<T extends Variant> extends Attribute {
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
  get props => [variant, value];
}

@immutable
class ContextVariantAttribute extends VariantAttribute<ContextVariant> {
  const ContextVariantAttribute(super.variant, super.style);

  bool when(BuildContext context) => variant.when(context);

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

@immutable
class MultiVariantAttribute extends VariantAttribute<MultiVariant> {
  const MultiVariantAttribute(super.variant, super.style);

  bool when(BuildContext context) => variant.when(context);

  // Remove all variants in given a list
  VariantAttribute remove(Iterable<Variant> variantsToRemove) {
    final variant = this.variant.remove(variantsToRemove);
    if (variant is MultiVariant) {
      return MultiVariantAttribute(variant, _style);
    } else if (variant is ContextVariant) {
      return ContextVariantAttribute(variant, _style);
    }

    return VariantAttribute(variant, _style);
  }

  bool matches(Iterable<Variant> otherVariants) =>
      variant.matches(otherVariants);

  @override
  MultiVariantAttribute merge(MultiVariantAttribute other) {
    if (other.variant != variant) {
      throw throwArgumentError(other);
    }

    return MultiVariantAttribute(variant, _style.merge(other._style));
  }
}
