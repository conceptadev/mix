import 'package:flutter/foundation.dart';
import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/attributes/nested_attribute.dart';
import 'package:mix/src/variants/variant_attribute.dart';
import 'package:mix/src/variants/variants.dart';

/// @nodoc
enum VariantOperator { and, or }

/// @nodoc
class VariantOperation<T extends Attribute> {
  final List<Variant<T>> variants;
  final VariantOperator operator;

  const VariantOperation(
    this.variants, {
    required this.operator,
  });

  VariantOperation<T> operator &(Variant<T> variant) {
    if (operator != VariantOperator.and) {
      throw 'All the operators in the equation must be the same';
    }

    variants.add(variant);

    return this;
  }

  VariantOperation<T> operator |(Variant<T> variant) {
    if (operator != VariantOperator.or) {
      throw 'All the operators in the equation must be the same';
    }

    variants.add(variant);

    return this;
  }

  List<VariantAttribute<T>> _buildOrOperations(
    List<T> attributes, {
    Iterable<Variant<T>>? variants,
  }) {
    variants ??= this.variants;
    final attributeVariants = variants.map((v) {
      return VariantAttribute<T>(
        v,
        attributes,
        shouldApply: v.shouldApply,
      );
    });

    return attributeVariants.toList();
  }

  List<VariantAttribute<T>> _buildAndOperations(
    List<T> attributes,
  ) {
    final attributeVariants = variants.map((variant) {
      final otherVariants = variants.where((otherV) => otherV != variant);

      return VariantAttribute(
        variant,
        _buildOrOperations(
          attributes,
          variants: otherVariants,
        ),
      );
    }) as Iterable<VariantAttribute<T>>;

    return attributeVariants.toList();
  }

  // ignore: long-parameter-list
  NestedAttribute<VariantAttribute<T>> call([
    T? p1,
    T? p2,
    T? p3,
    T? p4,
    T? p5,
    T? p6,
    T? p7,
    T? p8,
    T? p9,
    T? p10,
    T? p11,
    T? p12,
  ]) {
    final params = <T>[];
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

    List<VariantAttribute<T>> attributes = [];
    if (operator == VariantOperator.and) {
      attributes = _buildAndOperations(params);
    } else if (operator == VariantOperator.or) {
      attributes = _buildOrOperations(params);
    }

    return NestedAttribute<VariantAttribute<T>>(attributes);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VariantOperation<T> &&
        listEquals(other.variants, variants) &&
        other.operator == operator;
  }

  @override
  int get hashCode => variants.hashCode ^ operator.hashCode;

  @override
  String toString() => 'MultiVariant(variants: $variants, operator: $operator)';
}
