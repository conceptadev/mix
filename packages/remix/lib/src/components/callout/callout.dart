import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../theme/remix_theme.dart';
import '../../theme/remix_tokens.dart';

part 'callout.g.dart';
part 'callout_style.dart';
part 'callout_theme.dart';
part 'callout_widget.dart';

@MixableSpec()
base class CalloutSpec extends Spec<CalloutSpec> with _$CalloutSpec {
  final FlexBoxSpec flexContainer;
  final IconSpec icon;
  final TextSpec text;

  /// {@macro callout_spec_of}
  static const of = _$CalloutSpec.of;

  static const from = _$CalloutSpec.from;

  const CalloutSpec({
    FlexBoxSpec? flexContainer,
    IconSpec? icon,
    TextSpec? text,
    super.modifiers,
    super.animated,
  })  : flexContainer = flexContainer ?? const FlexBoxSpec(),
        icon = icon ?? const IconSpec(),
        text = text ?? const TextSpec();
}
