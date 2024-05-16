// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/material.dart';

import '../attributes/spacing/spacing_dto.dart';
import '../core/modifier.dart';
import '../factory/mix_provider_data.dart';

class PaddingSpec extends DecoratorSpec<PaddingSpec> {
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

class PaddingDecoratorAttribute
    extends DecoratorAttribute<PaddingDecoratorAttribute, PaddingSpec> {
  final SpacingDto padding;
  const PaddingDecoratorAttribute(this.padding);

  @override
  PaddingDecoratorAttribute merge(PaddingDecoratorAttribute? other) {
    return PaddingDecoratorAttribute(other?.padding ?? padding);
  }

  @override
  PaddingSpec resolve(MixData mix) => PaddingSpec(padding.resolve(mix));

  @override
  get props => [padding];
}
