import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../factory/mix_provider.dart';
import '../../factory/mix_provider_data.dart';
import '../../helpers/lerp_helpers.dart';
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
    super.animatedData,
  });

  const StackSpec.empty()
      : alignment = null,
        fit = null,
        textDirection = null,
        clipBehavior = null;

  static StackSpec of(BuildContext context) {
    final mix = Mix.of(context);

    return mix.attributeOf<StackSpecAttribute>()?.resolve(mix) ??
        const StackSpec.empty();
  }

  static StackSpec from(MixData mix) {
    return mix.attributeOf<StackSpecAttribute>()?.resolve(mix) ??
        const StackSpec.empty();
  }

  @override
  StackSpec lerp(StackSpec other, double t) {
    return StackSpec(
      alignment: AlignmentGeometry.lerp(alignment, other.alignment, t),
      fit: lerpSnap(fit, other.fit, t),
      textDirection: lerpSnap(textDirection, other.textDirection, t),
      clipBehavior: lerpSnap(clipBehavior, other.clipBehavior, t),
    );
  }

  @override
  StackSpec copyWith({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
    AnimatedData? animatedData,
  }) {
    return StackSpec(
      alignment: alignment ?? this.alignment,
      fit: fit ?? this.fit,
      textDirection: textDirection ?? this.textDirection,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      animatedData: animatedData ?? this.animatedData,
    );
  }

  @override
  List<Object?> get props => [alignment, fit, textDirection, clipBehavior];
}
