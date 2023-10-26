import 'package:flutter/material.dart';

import '../core/style_attribute.dart';
import '../factory/mix_provider_data.dart';
import 'alignment_geometry_attribute.dart';
import 'clip_attribute.dart';
import 'stack_fit_attribute.dart';
import 'text_direction_attribute.dart';

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

class StackSpec extends MixExtension<StackSpec> {
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
