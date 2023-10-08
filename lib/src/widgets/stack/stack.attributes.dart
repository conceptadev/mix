import 'package:flutter/material.dart';

import '../../attributes/alignment/alignment_geometry.attribute.dart';
import '../../attributes/attribute.dart';
import '../../attributes/enum/clip.attribute.dart';
import '../../attributes/resolvable_attribute.dart';
import '../../attributes/text/text_direction/text_direction.attribute.dart';
import '../../factory/mix_provider_data.dart';

class StackAttributes extends ResolvableAttribute<StackAttributesResolved> {
  final AlignmentGeometryAttribute? alignment;
  final StackFit? fit;
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
      alignment: other.alignment ?? alignment,
      fit: other.fit ?? fit,
      textDirection: other.textDirection ?? textDirection,
      clipBehavior: other.clipBehavior ?? clipBehavior,
    );
  }

  @override
  StackAttributesResolved resolve(MixData mix) {
    return StackAttributesResolved(
      alignment: alignment?.resolve(mix),
      fit: fit,
      textDirection: textDirection?.resolve(mix),
      clipBehavior: clipBehavior?.resolve(mix),
    );
  }

  @override
  List<Object?> get props => [alignment, fit, textDirection, clipBehavior];
}

class StackAttributesResolved extends Dto {
  final AlignmentGeometry? alignment;
  final StackFit? fit;
  final TextDirection? textDirection;
  final Clip? clipBehavior;

  const StackAttributesResolved({
    this.alignment,
    this.fit,
    this.textDirection,
    this.clipBehavior,
  });

  @override
  List<Object?> get props => [alignment, fit, textDirection, clipBehavior];
}
