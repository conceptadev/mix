import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../helpers/component_builder.dart';
import '../../helpers/utility_extension.dart';
import '../../theme/remix_theme.dart';
import '../../theme/remix_tokens.dart';

part 'avatar.g.dart';
part 'avatar_style.dart';
part 'avatar_theme.dart';
part 'avatar_widget.dart';

final $avatar = AvatarSpecUtility.self;

@MixableSpec()
base class AvatarSpec extends Spec<AvatarSpec> with _$AvatarSpec {
  final BoxSpec container;
  final StackSpec stack;
  final ImageSpec image;
  final TextSpec fallback;

  /// {@macro avatar_spec_of}
  static const of = _$AvatarSpec.of;

  static const from = _$AvatarSpec.from;

  const AvatarSpec({
    BoxSpec? container,
    ImageSpec? image,
    TextSpec? fallback,
    StackSpec? stack,
    super.animated,
  })  : stack = stack ?? const StackSpec(),
        container = container ?? const BoxSpec(),
        image = image ?? const ImageSpec(),
        fallback = fallback ?? const TextSpec();
}
