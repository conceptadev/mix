import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';
import '../spinner/spinner.dart';
import '../../helpers/component_builder.dart';

part 'button.g.dart';
part 'button_style.dart';
part 'button_widget.dart';

@MixableSpec()
class ButtonSpec extends Spec<ButtonSpec> with _$ButtonSpec, Diagnosticable {
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
    super.modifiers,
    SpinnerSpec? spinner,
    super.animated,
  })  : flex = flex ?? const FlexSpec(),
        container = container ?? const BoxSpec(),
        icon = icon ?? const IconSpec(),
        label = label ?? const TextSpec(),
        spinner = spinner ?? const SpinnerSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
