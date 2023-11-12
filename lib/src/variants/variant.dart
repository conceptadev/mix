import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../attributes/variant_attribute.dart';
import '../core/equality/compare_mixin.dart';
import '../factory/style_mix.dart';
import 'context_variant.dart';

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
  ]) {
    final params = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12];

    final nonNullableParams = params.whereType<Attribute>();
    final style = StyleMix.create(nonNullableParams);

    if (this is ContextVariant) {
      return ContextVariantAttribute(this as ContextVariant, style);
    }

    if (this is MultiVariant) {
      return MultiVariantAttribute(this as MultiVariant, style);
    }

    // Create a VariantAttribute using the collected parameters.
    // ignore: prefer-returning-conditional-expressions
    return VariantAttribute(this, StyleMix.create(nonNullableParams));
  }

  @override
  get props => [name];
}

/// A class representing a variant with multiple attributes.
/// It can be combined with other variants using logical AND (&) and OR (|) operations.
/// It can also be combined with a [ContextVariant] using a logical AND (&) operation.
/// It can be applied to a set of attributes and creates a [MultiVariantAttribute] instance.

enum MultiVariantType { and, or }

class MultiVariant extends Variant {
  final List<Variant> variants;
  final MultiVariantType type;

  const MultiVariant._(super.name, this.variants, {required this.type});

  factory MultiVariant(
    Iterable<Variant> variants, {
    MultiVariantType type = MultiVariantType.and,
  }) {
    final sortedVariants = variants.toList()
      ..sort(((a, b) => a.name.compareTo(b.name)));
    final combinedName = sortedVariants.map((e) => e.name).join('-');

    return MultiVariant._(combinedName, sortedVariants, type: type);
  }

  factory MultiVariant.and(Iterable<Variant> variants) => MultiVariant(
        variants,
      );

  factory MultiVariant.or(Iterable<Variant> variants) =>
      MultiVariant(variants, type: MultiVariantType.or);

  // Remove all variants in given a list
  Variant remove(Iterable<Variant> variantsToRemove) {
    final remainingVariants =
        variants.where((e) => !variantsToRemove.contains(e));

    return remainingVariants.length == 1
        ? remainingVariants.first
        : MultiVariant(remainingVariants);
  }

  bool matches(Iterable<Variant> otherVariants) {
    return type == MultiVariantType.and
        ? otherVariants.every((element) => variants.contains(element))
        : otherVariants.any((element) => variants.contains(element));
  }

  bool when(BuildContext context) {
    final contextVariants = variants.whereType<ContextVariant>();

    bool matchContextVariant(ContextVariant variant) => variant.when(context);

    if (type == MultiVariantType.or) {
      return contextVariants.any(matchContextVariant);
    }

    // If all variants are context variants apply the context
    return contextVariants.length == variants.length
        ? contextVariants.every(matchContextVariant)
        : false;
  }

  @override
  get props => [name, variants];
}
