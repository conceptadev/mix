import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../attributes/variant_attribute.dart';
import '../core/equality/compare_mixin.dart';
import '../factory/style_mix.dart';
import 'context_variant.dart';
import 'multi_variant.dart';

/// A class representing a variant, which is a combination of attributes.
/// It can be combined with other variants using logical AND (&) and OR (|) operations.
@immutable
class Variant with Comparable {
  final String name;

  /// Creates a new [Variant] with a given [name] and an optional [inverse] flag.
  const Variant(this.name);

  /// Combines this variant with another [variant] using a logical AND operation.
  MultiVariant operator &(Variant variant) => MultiVariant.and([this, variant]);

  /// Combines this variant with another [variant] using a logical OR operation.
  MultiVariant operator |(Variant variant) => MultiVariant.or([this, variant]);

  /// Applies the variant to a set of attributes and creates a [VariantAttribute] instance.
  /// Up to 12 optional [Attribute] parameters can be provided.

  VariantAttribute call([
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

    final style = StyleMix.create(params);

    if (this is ContextVariant) {
      return ContextVariantAttribute(this as ContextVariant, style);
    }

    if (this is MultiVariant) {
      return MultiVariantAttribute(this as MultiVariant, style);
    }

    // Create a VariantAttribute using the collected parameters.
    // ignore: prefer-returning-conditional-expressions
    return VariantAttribute(this, StyleMix.create(params));
  }

  @override
  get props => [name];
}
