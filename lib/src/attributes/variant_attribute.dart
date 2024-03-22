import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/style_mix.dart';
import '../variants/variant.dart';

@immutable
abstract class StyleVariantAttribute<V extends StyleVariant> extends Attribute
    with Mergeable<StyleVariantAttribute<V>> {
  final V variant;
  final Style _style;
  const StyleVariantAttribute(this.variant, Style style) : _style = style;

  Style get value => _style;

  bool matches(Iterable<StyleVariant> otherVariants) =>
      variant.matches(otherVariants);

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

mixin WhenVariant<T extends StyleVariant> on StyleVariantAttribute<T> {
  bool when(BuildContext context);
}

@immutable
class ContextVariantAttribute extends StyleVariantAttribute<ContextVariant>
    with WhenVariant<ContextVariant> {
  const ContextVariantAttribute(super.variant, super.style);

  @override
  bool when(BuildContext context) => variant.when(context);

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
class MultiVariantAttribute extends StyleVariantAttribute<MultiVariant>
    with WhenVariant<MultiVariant> {
  const MultiVariantAttribute(super.variant, super.style);

  // Remove all variants in given a list
  StyleVariantAttribute remove(Iterable<StyleVariant> variantsToRemove) {
    final variant = this.variant.remove(variantsToRemove);
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
  bool when(BuildContext context) => variant.when(context);

  @override
  MultiVariantAttribute merge(MultiVariantAttribute other) {
    if (other.variant != variant) throw throwArgumentError(other);

    return MultiVariantAttribute(variant, _style.merge(other._style));
  }
}
