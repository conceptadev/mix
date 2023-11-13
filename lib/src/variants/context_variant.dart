import 'dart:core';

import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../attributes/variant_attribute.dart';
import '../factory/style_mix.dart';
import 'variant.dart';

typedef WhenContextFunction = bool Function(BuildContext context);

@immutable
class ContextVariant extends Variant {
  final WhenContextFunction when;

  const ContextVariant(super.name, {required this.when});

  @override
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
    Attribute? p13,
    Attribute? p14,
    Attribute? p15,
    Attribute? p16,
    Attribute? p17,
    Attribute? p18,
    Attribute? p19,
    Attribute? p20,
  ]) {
    final params = [
      p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, //
      p11, p12, p13, p14, p15, p16, p17, p18, p19, p20,
    ].whereType<Attribute>();

    // Create a ContextVariantAttribute using the collected parameters.
    return ContextVariantAttribute(this, StyleMix.create(params));
  }

  @override
  get props => [name, when];
}
