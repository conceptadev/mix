import 'package:flutter/material.dart';

import '../core/attribute.dart';
import '../factory/style_mix.dart';

/// Allows to pass down Mixes as attributes for use with helpers.
@immutable
class StyleMixAttribute extends Attribute with Mergeable<StyleMixAttribute> {
  final StyleMix value;

  const StyleMixAttribute(this.value);

  @override
  StyleMixAttribute merge(StyleMixAttribute? other) {
    return other == null ? this : StyleMixAttribute(value.merge(other.value));
  }

  @override
  Object get type => StyleMixAttribute;

  @override
  get props => [value];
}
