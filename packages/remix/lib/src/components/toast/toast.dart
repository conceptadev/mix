import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../theme/remix_theme.dart';
import '../../theme/remix_tokens.dart';

part 'toast.g.dart';
part 'toast_style.dart';
part 'toast_widget.dart';
part 'toast_theme.dart';

@MixableSpec()
base class ToastSpec extends Spec<ToastSpec> with _$ToastSpec, Diagnosticable {
  final BoxSpec container;
  final FlexSpec mainFlex;
  final FlexSpec textFlex;
  final TextSpec title;
  final TextSpec description;

  /// {@macro toast_spec_of}
  static const of = _$ToastSpec.of;

  static const from = _$ToastSpec.from;

  const ToastSpec({
    BoxSpec? container,
    FlexSpec? mainFlex,
    FlexSpec? textFlex,
    TextSpec? title,
    TextSpec? description,
    super.modifiers,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        mainFlex = mainFlex ?? const FlexSpec(),
        textFlex = textFlex ?? const FlexSpec(),
        title = title ?? const TextSpec(),
        description = description ?? const TextSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
