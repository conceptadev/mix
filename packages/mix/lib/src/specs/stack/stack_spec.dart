import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

// ignore: avoid-importing-entrypoint-exports
import '../../../mix.dart';

part 'stack_spec.g.dart';

@MixableSpec()
final class StackSpec extends Spec<StackSpec> with _$StackSpec {
  final AlignmentGeometry? alignment;
  final StackFit? fit;
  final TextDirection? textDirection;
  final Clip? clipBehavior;

  static const of = _$StackSpec.of;

  static const from = _$StackSpec.from;

  const StackSpec({
    this.alignment,
    this.fit,
    this.textDirection,
    this.clipBehavior,
    super.animated,
  });
}
