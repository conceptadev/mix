import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../theme/remix_theme.dart';
import '../../theme/remix_tokens.dart';

part 'card.g.dart';
part 'card_style.dart';
part 'card_theme.dart';
part 'card_widget.dart';

@MixableSpec()
base class CardSpec extends Spec<CardSpec> with _$CardSpec, Diagnosticable {
  final BoxSpec container;

  /// {@macro card_spec_of}
  static const of = _$CardSpec.of;

  static const from = _$CardSpec.from;

  const CardSpec({
    BoxSpec? container,
    super.modifiers,
    super.animated,
  }) : container = container ?? const BoxSpec();

  Widget call({Key? key, required Widget child}) {
    return CardSpecWidget(key: key, spec: this, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
