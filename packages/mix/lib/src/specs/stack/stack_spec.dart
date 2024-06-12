import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../core/attribute.dart';
import '../../core/models/animated_data.dart';
import '../../core/models/mix_data.dart';
import '../../core/spec.dart';
import '../../exports/dtos.dart';
import '../../exports/utilities.dart';
import '../../factory/mix_provider.dart';

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
