import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/style_mix.dart';

const $group = NestedStyleAttribute.style;

/// Allows to pass down Mixes as attributes for use with helpers.
@immutable
class NestedStyleAttribute extends Attribute {
  final Style value;

  const NestedStyleAttribute(this.value);

  factory NestedStyleAttribute.style([
    Attribute? p1,
    Attribute? p2,
    Attribute? p3,
    Attribute? p4,
    Attribute? p5,
    Attribute? p6,
    Attribute? p7,
    Attribute? p8,
    Attribute? p9,
    Attribute? p10,
    Attribute? p11,
    Attribute? p12,
    Attribute? p13,
    Attribute? p14,
    Attribute? p15,
    Attribute? p16,
    Attribute? p17,
    Attribute? p18,
    Attribute? p19,
    Attribute? p20,
  ]) {
    final style = Style(
      p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, //
      p11, p12, p13, p14, p15, p16, p17, p18, p19, p20,
    );

    return NestedStyleAttribute(style);
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
  get props => [value];
}
