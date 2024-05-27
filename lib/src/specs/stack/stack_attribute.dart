import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'stack_spec.dart';

class StackSpecAttribute extends SpecAttribute<StackSpec> {
  final Clip? clipBehavior;
  final TextDirection? textDirection;
  final StackFit? fit;
  final AlignmentGeometry? alignment;
  const StackSpecAttribute({
    this.alignment,
    this.fit,
    this.textDirection,
    this.clipBehavior,
    super.animated,
  });

  static StackSpecAttribute of(MixData mix) {
    return mix.attributeOf() ?? const StackSpecAttribute();
  }

  @override
  StackSpec resolve(MixData mix) {
    return StackSpec.exhaustive(
      alignment: alignment,
      fit: fit,
      textDirection: textDirection,
      clipBehavior: clipBehavior,
      animated: mix.animation,
    );
  }

  @override
  StackSpecAttribute merge(covariant StackSpecAttribute? other) {
    if (other == null) return this;

    return StackSpecAttribute(
      alignment: other.alignment ?? alignment,
      fit: other.fit ?? fit,
      textDirection: other.textDirection ?? textDirection,
      clipBehavior: other.clipBehavior ?? clipBehavior,
      animated: other.animated ?? animated,
    );
  }

  @override
  List<Object?> get props =>
      [alignment, fit, textDirection, clipBehavior, animated];
}
