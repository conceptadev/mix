import 'package:flutter/material.dart';

import '../../attributes/variant_attribute.dart';
import '../../factory/style_mix.dart';
import '../attribute.dart';
import 'variant.dart';

typedef WhenContextFunction = bool Function(BuildContext context);

class ContextVariant extends Variant {
  final WhenContextFunction _when;

  const ContextVariant(super.name, {required WhenContextFunction when})
      : _when = when;

  get props => [name, _when];

  bool when(BuildContext context) => _when(context);

  @override
  // ignore: long-parameter-list
  ContextVariantAttribute call([
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
  ]) {
    final params = <Attribute>[];

    for (final param in [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12]) {
      if (param != null) params.add(param);
    }

    return ContextVariantAttribute(this, StyleMix.create(params));
  }
}
