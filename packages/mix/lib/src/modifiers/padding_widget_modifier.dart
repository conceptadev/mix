// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/attributes.dart';
import '../core/core.dart';

final class PaddingSpec extends WidgetModifierSpec<PaddingSpec> {
  final EdgeInsetsGeometry padding;
  const PaddingSpec(this.padding);

  @override
  PaddingSpec lerp(PaddingSpec? other, double t) {
    return PaddingSpec(
      EdgeInsetsGeometry.lerp(padding, other?.padding, t) ?? padding,
    );
  }

  @override
  PaddingSpec copyWith({EdgeInsetsGeometry? padding}) {
    return PaddingSpec(padding ?? this.padding);
  }

  @override
  get props => [padding];

  @override
  Widget build(Widget child) {
    return Padding(padding: padding, child: child);
  }
}

final class PaddingModifierAttribute
    extends WidgetModifierAttribute<PaddingModifierAttribute, PaddingSpec> {
  final SpacingDto padding;
  const PaddingModifierAttribute(this.padding);

  @override
  PaddingModifierAttribute merge(PaddingModifierAttribute? other) {
    return PaddingModifierAttribute(padding.merge(other?.padding));
  }

  @override
  PaddingSpec resolve(MixData mix) => PaddingSpec(padding.resolve(mix));

  @override
  get props => [padding];
}

final class PaddingModifierUtility<T extends Attribute>
    extends MixUtility<T, PaddingModifierAttribute> {
  const PaddingModifierUtility(super.builder);
  T call(SpacingDto value) => builder(PaddingModifierAttribute(value));
}
