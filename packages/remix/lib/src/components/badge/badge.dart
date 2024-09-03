import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../theme/remix_theme.dart';
import '../../theme/remix_tokens.dart';

part 'badge.g.dart';
part 'badge_style.dart';
part 'badge_theme.dart';
part 'badge_widget.dart';

final $badge = BadgeSpecUtility.self;

@MixableSpec()
base class BadgeSpec extends Spec<BadgeSpec> with _$BadgeSpec {
  final BoxSpec container;
  final TextSpec label;

  /// {@macro badge_spec_of}
  static const of = _$BadgeSpec.of;

  static const from = _$BadgeSpec.from;

  const BadgeSpec({BoxSpec? container, TextSpec? label, super.animated})
      : container = container ?? const BoxSpec(),
        label = label ?? const TextSpec();
}
