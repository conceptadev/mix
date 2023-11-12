import 'package:flutter/material.dart';

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
  get props => [name, variants];
}
