import 'package:flutter/foundation.dart';

import '../attributes/attribute.dart';
import '../attributes/nested_attribute.dart';
import '../factory/style_mix.dart';
import 'context_variant.dart';
import 'variant.dart';
import 'variant_attribute.dart';

enum EnumVariantOperator { and, or }

class VariantOperation {
  final List<StyleVariant> variants;
  final EnumVariantOperator operator;

  const VariantOperation(this.variants, {required this.operator});

  @override
  int get hashCode => variants.hashCode ^ operator.hashCode;

  VariantOperation operator &(StyleVariant variant) {
    if (operator != EnumVariantOperator.and) {
      throw ArgumentError('All the operators in the equation must be the same');
    }

    variants.add(variant);

    return this;
  }

  VariantOperation operator |(StyleVariant variant) {
    if (operator != EnumVariantOperator.or) {
      throw ArgumentError('All the operators in the equation must be the same');
    }

    variants.add(variant);

    return this;
  }

  // ignore: long-parameter-list
  NestedStyleAttribute call([
    StyleAttribute? p1,
    StyleAttribute? p2,
    StyleAttribute? p3,
    StyleAttribute? p4,
    StyleAttribute? p5,
    StyleAttribute? p6,
    StyleAttribute? p7,
    StyleAttribute? p8,
    StyleAttribute? p9,
    StyleAttribute? p10,
    StyleAttribute? p11,
    StyleAttribute? p12,
  ]) {
    final params = <StyleAttribute>[];
    for (final param in [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12]) {
      if (param != null) params.add(param);
    }

    List<VariantAttribute> attributes = [];
    if (operator == EnumVariantOperator.and) {
      attributes = _buildAndOperations(params);
    } else if (operator == EnumVariantOperator.or) {
      attributes = _buildOrOperations(params);
    }

    return NestedStyleAttribute(StyleMix.fromAttributes(attributes));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VariantOperation &&
        listEquals(other.variants, variants) &&
        other.operator == operator;
  }

  @override
  String toString() => 'MultiVariant(variants: $variants, operator: $operator)';
  List<VariantAttribute> _buildOrOperations(
    List<StyleAttribute> attributes, {
    Iterable<StyleVariant>? variants,
  }) {
    variants ??= this.variants;
    final style = StyleMix.fromAttributes(attributes);
    final attributeVariants = variants.map((variant) {
      return variant is ContextStyleVariant
          ? ContextVariantAttribute(variant, style)
          : VariantAttribute(variant, style);
    });

    return attributeVariants.toList();
  }

  List<VariantAttribute> _buildAndOperations(
    List<StyleAttribute> attributes,
  ) {
    final attributeVariants = variants.map((variant) {
      final otherVariants = variants.where((otherV) => otherV != variant);
      final mixToApply = StyleMix.fromAttributes(
        _buildOrOperations(attributes, variants: otherVariants),
      );

      return variant is ContextStyleVariant
          ? ContextVariantAttribute(variant, mixToApply)
          : VariantAttribute(variant, mixToApply);
    });

    return attributeVariants.toList();
  }
}
