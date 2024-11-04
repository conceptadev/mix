import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../helpers/utility_extension.dart';
import '../../theme/remix_theme.dart';
import '../../theme/remix_tokens.dart';

part 'radio.g.dart';
part 'radio_style.dart';
part 'radio_theme.dart';
part 'radio_widget.dart';

@MixableSpec()
base class RadioSpec extends Spec<RadioSpec> with _$RadioSpec, Diagnosticable {
  final BoxSpec container;
  final BoxSpec indicator;
  final FlexSpec layout;
  final TextSpec text;

  /// {@macro radio_spec_of}
  static const of = _$RadioSpec.of;

  static const from = _$RadioSpec.from;

  const RadioSpec({
    BoxSpec? container,
    BoxSpec? indicator,
    FlexSpec? layout,
    TextSpec? text,
    super.modifiers,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        indicator = indicator ?? const BoxSpec(),
        text = text ?? const TextSpec(),
        layout = layout ?? const FlexSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
