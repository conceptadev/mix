import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/helpers/utility_extension.dart';

import '../../helpers/variant.dart';
import '../../tokens/remix_tokens.dart';

part 'switch.g.dart';
part 'switch_style.dart';
part 'switch_variants.dart';
part 'switch_widget.dart';

@MixableSpec()
base class SwitchSpec extends Spec<SwitchSpec> with _$SwitchSpec {
  final BoxSpec container;
  final BoxSpec indicator;

  static const of = _$SwitchSpec.of;

  static const from = _$SwitchSpec.from;

  const SwitchSpec({
    BoxSpec? container,
    BoxSpec? indicator,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        indicator = indicator ?? const BoxSpec();
}
