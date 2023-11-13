import 'package:flutter/material.dart';

import '../attributes/attribute.dart';
import '../attributes/variant_attribute.dart';
import '../factory/style_mix.dart';
import 'context_variant.dart';
import 'variant.dart';

enum MultiVariantType { and, or }

@immutable
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
        ? variants.every(otherVariants.contains)
        : variants.any(otherVariants.contains);
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
  MultiVariantAttribute call([
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
    return MultiVariantAttribute(this, StyleMix.create(params));
  }

  @override
  get props => [name, variants];
}
