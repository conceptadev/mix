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

  bool when(BuildContext context) {
    return variant.when(context);
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
