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
  final FlexSpec layout;
  final BoxSpec indicatorContainer;
  final IconSpec indicatorIcon;
  final TextSpec label;

  /// {@macro checkbox_spec_of}
  static const of = _$CheckboxSpec.of;

  static const from = _$CheckboxSpec.from;

  const CheckboxSpec({
    BoxSpec? indicatorContainer,
    IconSpec? indicatorIcon,
    FlexSpec? layout,
    TextSpec? label,
    super.modifiers,
    super.animated,
  })  : indicatorContainer = indicatorContainer ?? const BoxSpec(),
        indicatorIcon = indicatorIcon ?? const IconSpec(),
        layout = layout ?? const FlexSpec(),
        label = label ?? const TextSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
