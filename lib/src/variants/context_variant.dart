import 'package:flutter/material.dart';

import '../../mix.dart';
import 'variant_attribute.dart';

typedef ShouldApplyFunc = bool Function(BuildContext);

class ContextVariant extends Variant {
  const ContextVariant(
    super.name, {
    required ShouldApplyFunc shouldApply,
    bool inverse = false,
  })  : _inverse = inverse,
        _shouldApply = shouldApply;

  final bool _inverse;

  final ShouldApplyFunc _shouldApply;

  bool shouldApply(BuildContext context) {
    return _inverse ? !_shouldApply(context) : _shouldApply(context);
  }

  @override
  // ignore: long-parameter-list
  ContextVariantAttribute call([
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
    final params = <Attribute>[];

    for (final param in [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12]) {
      if (param != null) params.add(param);
    }

    return ContextVariantAttribute(this, style: Mix.fromAttributes(params));
  }

  ContextVariant inverseInstance() {
    return ContextVariant(
      name,
      shouldApply: _shouldApply,
      inverse: !_inverse,
    );
  }

  @override
  get props => [name, _inverse, _shouldApply];
}
