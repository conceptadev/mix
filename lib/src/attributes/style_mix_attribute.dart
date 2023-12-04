import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/style_mix.dart';

@immutable
abstract class NestedStyleMixAttribute<
        Self extends NestedStyleMixAttribute<Self>> extends Attribute
    with Mergeable<Self> {
  final StyleMix value;

  const NestedStyleMixAttribute(this.value);

  Self _mergeWith(StyleMix otherValue);

  @override
  Self merge(Self? other) {
    if (other == null) return this as Self;

    return _mergeWith(other.value);
  }

  @override
  get props => [value];
}

/// Allows to pass down Mixes as attributes for use with helpers.
class StyleMixAttribute extends NestedStyleMixAttribute<StyleMixAttribute> {
  const StyleMixAttribute(super.value);

  @override
  StyleMixAttribute _mergeWith(StyleMix otherValue) =>
      StyleMixAttribute(value.merge(otherValue));
}
