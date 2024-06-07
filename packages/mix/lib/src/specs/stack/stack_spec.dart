import 'package:flutter/material.dart';

import '../../core/models/animated_data.dart';
import '../../core/spec.dart';
import '../../factory/mix_provider.dart';
import '../../factory/mix_provider_data.dart';
import '../../internal/lerp_helpers.dart';
import 'stack_attribute.dart';

class StackSpec extends Spec<StackSpec> {
  final AlignmentGeometry? alignment;
  final StackFit? fit;
  final TextDirection? textDirection;
  final Clip? clipBehavior;

  const StackSpec({
    this.alignment,
    this.fit,
    this.textDirection,
    this.clipBehavior,
    super.animated,
  });

  const StackSpec.exhaustive({
    required this.alignment,
    required this.fit,
    required this.textDirection,
    required this.clipBehavior,
    required super.animated,
  });

  static StackSpec of(BuildContext context) {
    final mix = Mix.of(context);

    return StackSpec.from(mix);
  }

  static StackSpec from(MixData mix) {
    return mix.attributeOf<StackSpecAttribute>()?.resolve(mix) ??
        const StackSpec();
  }

  @override
  StackSpec lerp(StackSpec? other, double t) {
    if (other == null) return this;

    return StackSpec(
      alignment: AlignmentGeometry.lerp(alignment, other.alignment, t),
      fit: lerpSnap(fit, other.fit, t),
      textDirection: lerpSnap(textDirection, other.textDirection, t),
      clipBehavior: lerpSnap(clipBehavior, other.clipBehavior, t),
      animated: other.animated ?? animated,
    );
  }

  @override
  StackSpec copyWith({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
    AnimatedData? animated,
  }) {
    return StackSpec(
      alignment: alignment ?? this.alignment,
      fit: fit ?? this.fit,
      textDirection: textDirection ?? this.textDirection,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      animated: animated ?? this.animated,
    );
  }

  @override
  List<Object?> get props =>
      [alignment, fit, textDirection, clipBehavior, animated];
}
