import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/factory/style_mix.dart';

/// Allows to pass down Mixes as attributes for use with helpers.
@immutable
final class NestedStyleAttribute extends Attribute {
  final Style value;

  const NestedStyleAttribute(this.value);

  factory NestedStyleAttribute.fromList(List<Attribute> attributes) {
    return NestedStyleAttribute(Style.create(attributes));
  }

  @override
  NestedStyleAttribute merge(NestedStyleAttribute? other) {
    return other == null
        ? this
        : NestedStyleAttribute(value.merge(other.value));
  }

  @override
  Type get mergeKey => NestedStyleAttribute;

  @override
  List<Object?> get props => [value];
}
