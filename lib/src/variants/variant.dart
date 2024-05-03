import 'package:flutter/material.dart';

import '../attributes/variant_attribute.dart';
import '../core/attribute.dart';
import '../factory/style_mix.dart';
import '../helpers/compare_mixin.dart';

enum VariantPriority {
  low(0),
  normal(1),
  high(2),
  highest(3);

  final int value;

  const VariantPriority(this.value);
}

@immutable
abstract class StyleVariant with Comparable {
  const StyleVariant();

  VariantPriority get priority;

  MultiVariant operator &(covariant StyleVariant variant) =>
      MultiVariant.and([this, variant]);

  MultiVariant operator |(covariant StyleVariant variant) =>
      MultiVariant.or([this, variant]);

  bool matches(Iterable<StyleVariant> matchVariants) =>
      matchVariants.contains(this);

  bool build(BuildContext context);
}

@immutable
class Variant extends StyleVariant {
  final String name;

  @override
  final priority = VariantPriority.normal;

  const Variant(this.name);

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

    return VariantAttribute(this, Style.create(params));
  }

  @override
  get props => [name];

  @override
  bool build(BuildContext context) => false;
}

@immutable
abstract class ContextVariant extends StyleVariant {
  final Key? key;
  @override
  final VariantPriority priority;

  const ContextVariant({this.key, this.priority = VariantPriority.normal});

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

    return VariantAttribute(this, Style.create(params));
  }

  @override
  get props => [key, priority];

  @override
  bool build(BuildContext context);
}

enum MultiVariantOperator { and, or }

@immutable
class MultiVariant extends StyleVariant {
  final List<StyleVariant> variants;

  final MultiVariantOperator operatorType;

  const MultiVariant._(this.variants, {required this.operatorType});

  factory MultiVariant(
    Iterable<StyleVariant> variants, {
    required MultiVariantOperator type,
  }) {
    final multiVariants = <MultiVariant>[];
    final otherVariants = <StyleVariant>[];

    for (var variant in variants) {
      if (variant is MultiVariant) {
        if (variant.operatorType == type) {
          otherVariants.addAll(variant.variants);
        } else {
          multiVariants.add(variant);
        }
      } else {
        otherVariants.add(variant);
      }
    }

    final combinedVariants = [...multiVariants, ...otherVariants];

    return MultiVariant._(combinedVariants.toList(), operatorType: type);
  }

  factory MultiVariant.and(Iterable<StyleVariant> variants) {
    return MultiVariant(variants, type: MultiVariantOperator.and);
  }

  factory MultiVariant.or(Iterable<StyleVariant> variants) {
    return MultiVariant(variants, type: MultiVariantOperator.or);
  }

  StyleVariant? remaining(Iterable<StyleVariant> variantsToRemove) {
    return remove(variantsToRemove);
  }

  StyleVariant? remove(Iterable<StyleVariant> variantsToRemove) {
    final remainingVariants = <StyleVariant>[];

    for (var variant in variants) {
      if (variant is MultiVariant) {
        final remaining = variant.remove(variantsToRemove);
        if (remaining != null) {
          remainingVariants.add(remaining);
        }
      } else {
        if (!variantsToRemove.contains(variant)) {
          remainingVariants.add(variant);
        }
      }
    }

    if (remainingVariants.isEmpty) {
      return null;
    }

    return remainingVariants.length == 1
        ? remainingVariants.first
        : MultiVariant(remainingVariants, type: operatorType);
  }

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

    return VariantAttribute(this, Style.create(params));
  }

  @override
  bool matches(Iterable<StyleVariant> matchVariants) {
    final list = variants.map((e) => e.matches(matchVariants)).toList();

    return operatorType == MultiVariantOperator.or
        ? list.contains(true)
        : list.every((e) => e);
  }

  @override
  VariantPriority get priority {
    final priorities =
        variants.whereType<ContextVariant>().map((e) => e.priority).toList();

    // Return normal priority if no priorities are found
    if (priorities.isEmpty) {
      return VariantPriority.normal;
    }

    // get highest priority
    return priorities.reduce(
      (value, element) => value.value > element.value ? value : element,
    );
  }

  @override
  get props => [variants, operatorType];

  @override
  bool build(BuildContext context) {
    var conditions = variants.map((e) => e.build(context));

    return operatorType == MultiVariantOperator.or
        ? conditions.contains(true)
        : conditions.every((e) => e);
  }
}
