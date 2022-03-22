import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

/// Used to check if its reserved
/// @nodoc
enum SystemVariants {
  dark,
  screenSize,
  orientation,
  disabled,
  focus,
  hover,
  pressing,
}

extension SystemVariantsExt on SystemVariants {
  /// Returns the name of the variant
  String get value {
    return toString().split('.').last;
  }
}

/// @nodoc
enum _VariantOperations {
  and,
  or,
}

/// @nodoc
class MultiVariant<T extends Attribute> {
  const MultiVariant(
    this.variants, {
    required this.operator,
  });

  final List<Variant<T>> variants;
  final _VariantOperations operator;

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
    if (operator == _VariantOperations.and) {
      attributes = _buildAndOperations(params);
    } else if (operator == _VariantOperations.or) {
      attributes = _buildOrOperations(params);
    }

    return NestedAttribute<VariantAttribute<T>>(attributes);
  }
}

/// {@category Variants}
class Variant<T extends Attribute> {
  const Variant(this.name, {this.shouldApply});

  final String name;

  final bool Function(BuildContext)? shouldApply;

  MultiVariant<T> operator &(Variant<T> variant) =>
      MultiVariant<T>([this, variant], operator: _VariantOperations.and);

  MultiVariant<T> operator |(Variant<T> variant) =>
      MultiVariant<T>([this, variant], operator: _VariantOperations.or);

  VariantAttribute<T> call([
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

    return VariantAttribute<T>(
      this,
      params,
      shouldApply: shouldApply,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Variant && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => 'Var(name: $name)';
}
