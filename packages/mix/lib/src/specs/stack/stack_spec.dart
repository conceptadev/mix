import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../../mix.dart';

part 'stack_spec.g.dart';

@MixableSpec()
class StackSpec extends Spec<StackSpec> with StackSpecMixable {
  final AlignmentGeometry? alignment;
  final StackFit? fit;
  final TextDirection? textDirection;
  final Clip? clipBehavior;

  static const of = StackSpecMixable.of;

  static const from = StackSpecMixable.from;

  const StackSpec({
    this.alignment,
    this.fit,
    this.textDirection,
    this.clipBehavior,
    super.animated,
  });
}
