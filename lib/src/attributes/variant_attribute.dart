import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/style_mix.dart';
import '../variants/variant.dart';

@immutable
class StyleVariantAttribute<V extends StyleVariant> extends Attribute
    with Mergeable<StyleVariantAttribute<V>> {
  final V variant;
  final Style _style;
  const StyleVariantAttribute(this.variant, Style style) : _style = style;

  Style get value => _style;

  VariantPriority get priority => variant.priority;

  bool matches(Iterable<StyleVariant> otherVariants) =>
      variant.matches(otherVariants);

  @override
  StyleVariantAttribute<V> merge(covariant StyleVariantAttribute<V> other) {
    if (other.variant != variant) throw throwArgumentError(other);

    return StyleVariantAttribute(variant, _style.merge(other._style));
  }

  @override
  get props => [variant, _style];

  @override
  Object get type => ObjectKey(variant);
}

@immutable
class VariantAttribute extends StyleVariantAttribute<Variant> {
  const VariantAttribute(super.variant, super.style);

  @override
  VariantAttribute merge(VariantAttribute other) {
    if (other.variant != variant) throw throwArgumentError(other);

    return VariantAttribute(variant, _style.merge(other._style));
  }
}

@immutable
class ContextVariantAttribute extends StyleVariantAttribute<ContextVariant> {
  const ContextVariantAttribute(super.variant, super.style);

  @override
  ContextVariantAttribute merge(ContextVariantAttribute other) {
    if (other.variant != variant) throw throwArgumentError(other);

    return ContextVariantAttribute(variant, _style.merge(other._style));
  }
}

ArgumentError throwArgumentError<T extends StyleVariantAttribute>(T other) {
  throw ArgumentError.value(
    other.runtimeType,
    'other',
    'VariantAttribute must have the same variant',
  );
}

@immutable
class MultiVariantAttribute extends StyleVariantAttribute<MultiVariant> {
  const MultiVariantAttribute(super.variant, super.style);

  // Remove all variants in given a list
  StyleVariantAttribute? remaining(Iterable<StyleVariant> variantsToRemove) {
    final variant = this.variant.remove(variantsToRemove);
    if (variant == null) {
      return null;
    }
    if (variant is MultiVariant) {
      return MultiVariantAttribute(variant, _style);
    } else if (variant is ContextVariant) {
      return ContextVariantAttribute(variant, _style);
    } else if (variant is Variant) {
      return VariantAttribute(variant, _style);
    }
    throw ArgumentError.value(
      variant,
      'variant',
      'Variant must be a Variant, ContextVariant, or MultiVariant',
    );
  }

  @override
  MultiVariantAttribute merge(MultiVariantAttribute other) {
    if (other.variant != variant) throw throwArgumentError(other);

    return MultiVariantAttribute(variant, _style.merge(other._style));
  }
}
