import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../mix.dart';

part 'stack_spec.g.dart';

@MixableSpec()
class StackDef extends Spec<StackDef> with StackDefMixable {
  final AlignmentGeometry? alignment;
  final StackFit? fit;
  final TextDirection? textDirection;
  final Clip? clipBehavior;

  const StackDef({
    this.alignment,
    this.fit,
    this.textDirection,
    this.clipBehavior,
    super.animated,
  });
}
