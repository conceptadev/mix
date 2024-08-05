import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/helpers/variant.dart';

import '../../tokens/remix_tokens.dart';

part 'progress.g.dart';
part 'progress_style.dart';
part 'progress_variants.dart';
part 'progress_widget.dart';
part 'progress_blank.dart';

@MixableSpec()
base class ProgressSpec extends Spec<ProgressSpec>
    with _$ProgressSpec, Diagnosticable {
  final BoxSpec container;
  final BoxSpec track;
  final BoxSpec fill;

  /// {@macro progress_spec_of}
  static const of = _$ProgressSpec.of;

  static const from = _$ProgressSpec.from;

  const ProgressSpec({
    BoxSpec? container,
    BoxSpec? track,
    BoxSpec? fill,
    super.animated,
    super.modifiers,
  })  : container = container ?? const BoxSpec(),
        track = track ?? const BoxSpec(),
        fill = fill ?? const BoxSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
