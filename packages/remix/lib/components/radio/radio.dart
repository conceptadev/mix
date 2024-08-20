import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';
import '../../helpers/utility_extension.dart';

import '../../helpers/variant.dart';
import '../../tokens/remix_tokens.dart';

part 'radio.g.dart';
part 'radio_style.dart';
part 'radio_variants.dart';
part 'radio_widget.dart';
part 'radio_blank.dart';

@MixableSpec()
base class RadioSpec extends Spec<RadioSpec> with _$RadioSpec, Diagnosticable {
  final BoxSpec container;
  final BoxSpec indicator;

  /// {@macro radio_spec_of}
  static const of = _$RadioSpec.of;

  static const from = _$RadioSpec.from;

  const RadioSpec({
    BoxSpec? container,
    BoxSpec? indicator,
    super.modifiers,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        indicator = indicator ?? const BoxSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
