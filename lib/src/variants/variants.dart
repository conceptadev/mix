import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/variants/variant_attribute.dart';
import 'package:mix/src/variants/variant_operation.dart';

/// {@category Variants}
class Variant<T extends Attribute> {
  final String name;
  final bool Function(BuildContext)? shouldApply;

  final bool inverse;

  const Variant(this.name, {this.shouldApply}) : inverse = false;
  const Variant._inverse(this.name, {this.shouldApply}) : inverse = true;

  VariantOperation<T> operator &(Variant<T> variant) =>
      VariantOperation<T>([this, variant], operator: VariantOperator.and);

  VariantOperation<T> operator |(Variant<T> variant) =>
      VariantOperation<T>([this, variant], operator: VariantOperator.or);

  // ignore: long-parameter-list
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

    return other is Variant<T> &&
        other.name == name &&
        other.shouldApply == shouldApply;
  }

  @override
  int get hashCode => name.hashCode ^ shouldApply.hashCode;

  @override
  String toString() => 'Variant(name: $name)';

  Variant<T> inverseInstance() {
    return Variant<T>._inverse(
      name,
      shouldApply: shouldApply,
    );
  }
}
