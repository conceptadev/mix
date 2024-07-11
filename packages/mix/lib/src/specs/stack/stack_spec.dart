// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

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
    super.modifiers,
  });

  Widget call({List<Widget> children = const []}) {
    return StackSpecWidget(spec: this, children: children);
  }
}
