import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../mix.dart';

part 'flex_spec.g.dart';

@MixableSpec()
class FlexDef extends Spec<FlexDef> with FlexDefMixable {
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final VerticalDirection? verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final Clip? clipBehavior;
  final double? gap;

  const FlexDef({
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.verticalDirection,
    this.direction,
    this.textDirection,
    this.textBaseline,
    this.clipBehavior,
    this.gap,
    super.animated,
  });
}
