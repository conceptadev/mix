import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/components/spinner/spinner.dart';

import '../../helpers/variant.dart';
import '../../tokens/remix_tokens.dart';

part 'button.g.dart';
part 'button_style.dart';
part 'button_variants.dart';
part 'button_widget.dart';

@MixableSpec()
base class ButtonSpec extends Spec<ButtonSpec> with _$ButtonSpec {
  final FlexSpec flex;
  final BoxSpec container;
  final IconSpec icon;
  final TextSpec label;

  @MixableProperty(dto: MixableFieldDto(type: 'SpinnerSpecAttribute'))
  final SpinnerSpec spinner;

  /// {@macro button_spec_of}
  static const of = _$ButtonSpec.of;

  static const from = _$ButtonSpec.from;

  const ButtonSpec({
    BoxSpec? container,
    FlexSpec? flex,
    IconSpec? icon,
    TextSpec? label,
    SpinnerSpec? spinner,
    super.animated,
  })  : flex = flex ?? const FlexSpec(),
        container = container ?? const BoxSpec(),
        icon = icon ?? const IconSpec(),
        label = label ?? const TextSpec(),
        spinner = spinner ?? const SpinnerSpec();
}
