import 'package:flutter/widgets.dart';

import '../attributes/attribute.dart';
import '../mixer/mix_factory.dart';
import 'variant_attribute.dart';
import 'variants.dart';

class WhenVariant<T extends Attribute> extends Variant<T> {
  final bool apply;

  WhenVariant(String name, this.apply) : super(name, shouldApply: (_) => apply);

  @override

  /// If clause:
  ///
  /// ```dart
  /// final mix = Mix(
  ///   when(apply)(
  ///     // if clause
  ///   )(
  ///     // else clause
  ///   ),
  /// ),
  /// ```
  // ignore: long-parameter-list
  WhenVariantAttribute<T> call([
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
    final attribute =
        super.call(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12);

    return WhenVariantAttribute<T>(
      attribute.variant,
      attribute.value,
      apply,
    );
  }
}

class WhenVariantAttribute<T extends Attribute> extends VariantAttribute<T> {
  final bool apply;

  WhenVariantAttribute(
    Variant<T> variant,
    Mix mix,
    this.apply,
  ) : super(variant, mix);

  @override
  bool shouldApply(BuildContext context) {
    return apply;
  }

  /// Else clause:
  ///
  /// ```dart
  /// final mix = Mix(
  ///   when(apply)(
  ///     // if clause
  ///   )(
  ///     // else clause
  ///   ),
  /// ),
  /// ```
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
    if (apply) return WhenVariantAttribute(variant, value, apply);

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

    return WhenVariantAttribute(variant, Mix.fromList(params), !apply);
  }
}
