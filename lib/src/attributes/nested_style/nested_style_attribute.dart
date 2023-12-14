import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/style_mix.dart';

/// Allows to pass down Mixes as attributes for use with helpers.
@immutable
class NestedStyleAttribute extends Attribute
    with Mergeable<NestedStyleAttribute> {
  final Style value;

  const NestedStyleAttribute(this.value);

  @override
  NestedStyleAttribute merge(NestedStyleAttribute? other) {
    return other == null
        ? this
        : NestedStyleAttribute(value.merge(other.value));
  }

  @override
  Object get type => NestedStyleAttribute;

  @override
  get props => [value];
}
