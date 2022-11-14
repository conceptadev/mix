import 'package:flutter/widgets.dart';

import '../attributes/attribute.dart';
import '../mixer/mix_factory.dart';
import 'context_variant.dart';
import 'variant_attribute.dart';

class WhenVariant extends ContextVariant {
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
  WhenVariantAttribute call([
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
    final attribute =
        super.call(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12);

    return WhenVariantAttribute(
      attribute.variant,
      attribute.value,
      apply,
    );
  }
}

class WhenVariantAttribute extends ContextVariantAttribute {
  final bool apply;

  WhenVariantAttribute(
    ContextVariant variant,
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
    if (apply) return WhenVariantAttribute(variant, value, apply);

    final params = <Attribute>[];
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
