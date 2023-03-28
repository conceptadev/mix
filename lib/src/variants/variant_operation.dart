import 'package:flutter/foundation.dart';

import '../attributes/attribute.dart';
import '../attributes/nested_attribute.dart';
import '../mixer/mix_factory.dart';
import 'context_variant.dart';
import 'variant.dart';
import 'variant_attribute.dart';

enum EnumVariantOperator { and, or }

class VariantOperation {
  final List<Variant> variants;
  final EnumVariantOperator operator;

  const VariantOperation(
    this.variants, {
    required this.operator,
  });

  VariantOperation operator &(Variant variant) {
    if (operator != EnumVariantOperator.and) {
      throw 'All the operators in the equation must be the same';
    }

    variants.add(variant);

    return this;
  }

  VariantOperation operator |(Variant variant) {
    if (operator != EnumVariantOperator.or) {
      throw 'All the operators in the equation must be the same';
    }

    variants.add(variant);

    return this;
  }

  List<VariantAttribute> _buildOrOperations(
    List<Attribute> attributes, {
    Iterable<Variant>? variants,
  }) {
    variants ??= this.variants;
    final attributeVariants = variants.map((variant) {
      if (variant is ContextVariant) {
        return ContextVariantAttribute(variant, Mix.fromAttributes(attributes));
      } else {
        return VariantAttribute(variant, Mix.fromAttributes(attributes));
      }
    });

    return attributeVariants.toList();
  }

  List<VariantAttribute> _buildAndOperations(
    List<Attribute> attributes,
  ) {
    final attributeVariants = variants.map((variant) {
      final otherVariants = variants.where((otherV) => otherV != variant);

      final mixToApply = Mix.fromAttributes(
        _buildOrOperations(
          attributes,
          variants: otherVariants,
        ),
      );
      if (variant is ContextVariant) {
        return ContextVariantAttribute(
          variant,
          mixToApply,
        );
      } else {
        return VariantAttribute(
          variant,
          mixToApply,
        );
      }
    });

    return attributeVariants.toList();
  }

  // ignore: long-parameter-list
  NestedMixAttribute<VariantAttribute> call([
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
    final params = [] as List<Attribute>;
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

    List<VariantAttribute> attributes = [];
    if (operator == EnumVariantOperator.and) {
      attributes = _buildAndOperations(params);
    } else if (operator == EnumVariantOperator.or) {
      attributes = _buildOrOperations(params);
    }

    return NestedMixAttribute<VariantAttribute>(Mix.fromAttributes(attributes));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VariantOperation &&
        listEquals(other.variants, variants) &&
        other.operator == operator;
  }

  @override
  int get hashCode => variants.hashCode ^ operator.hashCode;

  @override
  String toString() => 'MultiVariant(variants: $variants, operator: $operator)';
}
