import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../mixer/mix_factory.dart';
import 'variant.dart';
import 'variant_attribute.dart';

class ContextVariant extends Variant {
  const ContextVariant(
    String name, {
    required this.shouldApply,
    inverse = false,
  }) : super(
          name,
          inverse: inverse,
        );

  final bool Function(BuildContext) shouldApply;

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
    if (p1 != null) params.add(p1);
    if (p2 != null) params.add(p2);
    if (p3 != null) params.add(p3);
    if (p4 != null) params.add(p4);
    if (p5 != null) params.add(p5);
    if (p6 != null) params.add(p6);
    if (p7 != null) params.add(p7);
    if (p8 != null) params.add(p8);
    if (p9 != null) params.add(p9);
    if (p10 != null) params.add(p10);
    if (p11 != null) params.add(p11);
    if (p12 != null) params.add(p12);

    return ContextVariantAttribute(this, MixFactory.fromAttributes(params));
  }

  @override
  ContextVariant inverseInstance() {
    return ContextVariant(
      name,
      shouldApply: shouldApply,
      inverse: true,
    );
  }

  @override
  String toString() => 'ContextVariant(shouldApply: $shouldApply)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContextVariant &&
        other.shouldApply == shouldApply &&
        other.inverse == inverse &&
        other.name == name;
  }

  @override
  int get hashCode => shouldApply.hashCode ^ inverse.hashCode ^ name.hashCode;
}
