import 'package:flutter/material.dart';

import '../../attributes/alignment_geometry.attribute.dart';
import '../../attributes/enum/clip.attribute.dart';
import '../../attributes/stack_fit.attribute.dart';
import '../../attributes/style_attribute.dart';
import '../../attributes/text_direction.attribute.dart';
import '../../factory/mix_provider_data.dart';

class StackAttributes extends SpecAttribute<StackSpec> {
  final AlignmentGeometryAttribute? alignment;
  final StackFitAttribute? fit;
  final TextDirectionAttribute? textDirection;
  final ClipAttribute? clipBehavior;

  const StackAttributes({
    this.alignment,
    this.fit,
    this.textDirection,
    this.clipBehavior,
  });

  @override
  StackAttributes merge(StackAttributes? other) {
    if (other == null) return this;

    return StackAttributes(
      alignment: mergeAttr(alignment, other.alignment),
      fit: mergeAttr(fit, other.fit),
      textDirection: mergeAttr(textDirection, other.textDirection),
      clipBehavior: mergeAttr(clipBehavior, other.clipBehavior),
    );
  }

  @override
  StackSpec resolve(MixData mix) {
    return StackSpec(
      alignment: resolveAttr(alignment, mix),
      fit: resolveAttr(fit, mix),
      textDirection: resolveAttr(textDirection, mix),
      clipBehavior: resolveAttr(clipBehavior, mix),
    );
  }

  @override
  List<Object?> get props => [alignment, fit, textDirection, clipBehavior];
}

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
  });

  @override
  StackSpec lerp(StackSpec other, double t) {
    return StackSpec(
      alignment: AlignmentGeometry.lerp(alignment, other.alignment, t),
      fit: t < 0.5 ? fit : other.fit,
      textDirection: t < 0.5 ? textDirection : other.textDirection,
      clipBehavior: t < 0.5 ? clipBehavior : other.clipBehavior,
    );
  }

  @override
  StackSpec copyWith({
    AlignmentGeometry? alignment,
    StackFit? fit,
    TextDirection? textDirection,
    Clip? clipBehavior,
  }) {
    return StackSpec(
      alignment: alignment ?? this.alignment,
      fit: fit ?? this.fit,
      textDirection: textDirection ?? this.textDirection,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  @override
  List<Object?> get props => [alignment, fit, textDirection, clipBehavior];
}
