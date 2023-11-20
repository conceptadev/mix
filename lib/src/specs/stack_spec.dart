import 'package:flutter/material.dart';

import '../attributes/alignment_attribute.dart';
import '../attributes/attribute.dart';
import '../attributes/scalar_attribute.dart';
import '../factory/mix_provider_data.dart';

class StackSpec extends MixRecipe<StackSpec> {
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

  static StackSpec resolve(MixData mix) {
    return StackSpec(
      alignment: mix.get<AlignmentGeometryAttribute, AlignmentGeometry>(),
      fit: mix.get<StackFitAttribute, StackFit>(),
      textDirection: mix.get<TextDirectionAttribute, TextDirection>(),
      clipBehavior: mix.get<ClipAttribute, Clip>(),
    );
  }

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
