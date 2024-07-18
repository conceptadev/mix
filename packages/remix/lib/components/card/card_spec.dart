import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'card_spec.g.dart';

@MixableSpec()
base class CardSpec extends Spec<CardSpec> with _$CardSpec {
  final BoxSpec container;

  final FlexSpec flex;

  /// {@macro card_spec_of}
  static const of = _$CardSpec.of;

  static const from = _$CardSpec.from;

  const CardSpec({
    BoxSpec? container,
    FlexSpec? flex,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        flex = flex ?? const FlexSpec();
}
