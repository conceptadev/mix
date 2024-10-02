import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../theme/remix_theme.dart';
import '../../theme/remix_tokens.dart';

part 'divider.g.dart';
part 'divider_style.dart';
part 'divider_theme.dart';
part 'divider_widget.dart';

@MixableSpec()
base class DividerSpec extends Spec<DividerSpec>
    with _$DividerSpec, Diagnosticable {
  final BoxSpec container;
  final FlexSpec flex;
  final TextSpec label;

  /// {@macro progress_spec_of}
  static const of = _$DividerSpec.of;

  static const from = _$DividerSpec.from;

  const DividerSpec({
    BoxSpec? container,
    FlexSpec? flex,
    TextSpec? label,
    super.animated,
    super.modifiers,
  })  : container = container ?? const BoxSpec(),
        flex = flex ?? const FlexSpec(),
        label = label ?? const TextSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
