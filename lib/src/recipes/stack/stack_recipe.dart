import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'stack_attribute.dart';

class StackRecipeMix extends RecipeMix<StackRecipeMix> {
  final AlignmentGeometry? alignment;
  final StackFit? fit;
  final TextDirection? textDirection;
  final Clip? clipBehavior;

  const StackRecipeMix({
    this.alignment,
    this.fit,
    this.textDirection,
    this.clipBehavior,
  });

  static StackRecipeMix resolve(MixData mix) {
    final recipe = mix.attributeOfType<StackAttribute>()?.resolve(mix);

    return recipe ?? const StackRecipeMix();
  }

  @override
  StackRecipeMix lerp(StackRecipeMix other, double t) {
    return StackRecipeMix(
      alignment: AlignmentGeometry.lerp(alignment, other.alignment, t),
      fit: t < 0.5 ? fit : other.fit,
      textDirection: t < 0.5 ? textDirection : other.textDirection,
      clipBehavior: t < 0.5 ? clipBehavior : other.clipBehavior,
    );
  }

  @override
  StackRecipeMix copyWith({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
  }) {
    return StackRecipeMix(
      alignment: alignment ?? this.alignment,
      fit: fit ?? this.fit,
      textDirection: textDirection ?? this.textDirection,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  List<Object?> get props => [alignment, fit, textDirection, clipBehavior];
}
