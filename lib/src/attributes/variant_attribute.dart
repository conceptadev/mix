import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/style_mix.dart';
import '../variants/context_variant.dart';
import '../variants/multi_variant.dart';
import '../variants/variant.dart';

@immutable
class VariantAttribute<T extends Variant> extends Attribute
    with Mergeable<VariantAttribute<T>> {
  final T variant;
  final Style _style;

  const VariantAttribute(this.variant, Style style) : _style = style;

  Style get value => _style;

  @override
  VariantAttribute<T> merge(VariantAttribute<T> other) {
    if (other.variant != variant) throw throwArgumentError(other);

    return VariantAttribute(variant, _style.merge(other._style));
  }

  @override
  Object get type => ObjectKey(variant);

  @override
  get props => [variant, value];
}

mixin WhenVariant<T extends Variant> on VariantAttribute<T> {
  bool when(BuildContext context);
}

@immutable
class ContextVariantAttribute extends VariantAttribute<ContextVariant>
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

ArgumentError throwArgumentError<T extends VariantAttribute>(T other) {
  throw ArgumentError.value(
    other.runtimeType,
    'other',
    'VariantAttribute must have the same variant',
  );
}

@immutable
class MultiVariantAttribute extends VariantAttribute<MultiVariant>
    with WhenVariant<MultiVariant> {
  const MultiVariantAttribute(super.variant, super.style);

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
  bool when(BuildContext context) => variant.when(context);

  @override
  MultiVariantAttribute merge(MultiVariantAttribute other) {
    if (other.variant != variant) throw throwArgumentError(other);

    return MultiVariantAttribute(variant, _style.merge(other._style));
  }
}

@immutable
class GestureContextVariantAttribute extends ContextVariantAttribute {
  const GestureContextVariantAttribute(super.variant, super.style);

  @override
  GestureContextVariantAttribute merge(GestureContextVariantAttribute other) {
    if (other.variant != variant) throw throwArgumentError(other);

    return GestureContextVariantAttribute(variant, _style.merge(other._style));
  }
}
