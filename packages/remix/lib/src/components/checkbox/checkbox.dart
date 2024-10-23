import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../theme/remix_theme.dart';
import '../../theme/remix_tokens.dart';

part 'checkbox.g.dart';
part 'checkbox_style.dart';
part 'checkbox_theme.dart';
part 'checkbox_widget.dart';

@MixableSpec()
base class CheckboxSpec extends Spec<CheckboxSpec>
    with _$CheckboxSpec, Diagnosticable {
  final BoxSpec container;
  final FlexSpec containerLayout;
  final IconSpec indicator;
  final TextSpec label;

  /// {@macro checkbox_spec_of}
  static const of = _$CheckboxSpec.of;

  static const from = _$CheckboxSpec.from;

  const CheckboxSpec({
    BoxSpec? container,
    IconSpec? indicator,
    FlexSpec? containerLayout,
    TextSpec? label,
    super.modifiers,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        indicator = indicator ?? const IconSpec(),
        containerLayout = containerLayout ?? const FlexSpec(),
        label = label ?? const TextSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
