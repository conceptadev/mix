import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider_data.dart';
import 'stack_attribute.dart';

class StackMixture extends Mixture<StackMixture> {
  final AlignmentGeometry? alignment;
  final StackFit? fit;
  final TextDirection? textDirection;
  final Clip? clipBehavior;

  const StackMixture({
    this.alignment,
    this.fit,
    this.textDirection,
    this.clipBehavior,
  });

  static StackMixture resolve(MixData mix) {
    return mix.resolvableOf(const StackMixAttribute());
  }

  @override
  StackMixture lerp(StackMixture other, double t) {
    return StackMixture(
      alignment: AlignmentGeometry.lerp(alignment, other.alignment, t),
      fit: t < 0.5 ? fit : other.fit,
      textDirection: t < 0.5 ? textDirection : other.textDirection,
      clipBehavior: t < 0.5 ? clipBehavior : other.clipBehavior,
    );
  }

  @override
  StackMixture merge(StackMixture? other) {
    return copyWith(
      alignment: other?.alignment,
      fit: other?.fit,
      textDirection: other?.textDirection,
      clipBehavior: other?.clipBehavior,
    );
  }

  @override
  StackMixture copyWith({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
  }) {
    return StackMixture(
      alignment: alignment ?? this.alignment,
      fit: fit ?? this.fit,
      textDirection: textDirection ?? this.textDirection,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  List<Object?> get props => [alignment, fit, textDirection, clipBehavior];
}
