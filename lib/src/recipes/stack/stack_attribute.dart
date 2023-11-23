import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'stack_recipe.dart';

class StackAttribute extends ResolvableAttribute<StackRecipeMix> {
  final AlignmentGeometry? alignment;
  final StackFit? fit;
  final TextDirection? textDirection;
  final Clip? clipBehavior;

  const StackAttribute({
    this.alignment,
    this.fit,
    this.textDirection,
    this.clipBehavior,
  });

  @override
  StackRecipeMix resolve(MixData mix) {
    return StackRecipeMix(
      alignment: alignment,
      fit: fit,
      textDirection: textDirection,
      clipBehavior: clipBehavior,
    );
  }

  @override
  StackAttribute merge(covariant StackAttribute? other) {
    if (other == null) return this;

    return StackAttribute(
      alignment: alignment ?? other.alignment,
      fit: fit ?? other.fit,
      textDirection: textDirection ?? other.textDirection,
      clipBehavior: clipBehavior ?? other.clipBehavior,
    );
  }

  @override
  List<Object?> get props => [alignment, fit, textDirection, clipBehavior];
}
