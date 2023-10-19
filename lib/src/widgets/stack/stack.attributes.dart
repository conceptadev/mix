import 'package:flutter/material.dart';

import '../../attributes/alignment/alignment_geometry.attribute.dart';
import '../../attributes/enum/clip.attribute.dart';
import '../../attributes/stack/stack_fit.attribute.dart';
import '../../attributes/style_attribute.dart';
import '../../attributes/text/text_direction/text_direction.attribute.dart';
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
      alignment: mergeProp(alignment, other.alignment),
      fit: mergeProp(fit, other.fit),
      textDirection: mergeProp(textDirection, other.textDirection),
      clipBehavior: mergeProp(clipBehavior, other.clipBehavior),
    );
  }

  @override
  StackSpec resolve(MixData mix) {
    return StackSpec(
      alignment: resolveAttribute(alignment, mix),
      fit: resolveAttribute(fit, mix),
      textDirection: resolveAttribute(textDirection, mix),
      clipBehavior: resolveAttribute(clipBehavior, mix),
    );
  }

  @override
  List<Object?> get props => [alignment, fit, textDirection, clipBehavior];
}

class StackSpec extends Spec {
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
  List<Object?> get props => [alignment, fit, textDirection, clipBehavior];
}
