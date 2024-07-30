import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';
import 'package:remix/helpers/utility_extension.dart';

import '../../helpers/variant.dart';
import '../../tokens/remix_tokens.dart';

part 'avatar.g.dart';
part 'avatar_style.dart';
part 'avatar_variants.dart';
part 'avatar_widget.dart';
part 'avatar_blank.dart';

@MixableSpec()
base class AvatarSpec extends Spec<AvatarSpec> with _$AvatarSpec {
  final BoxSpec container;
  final ImageSpec image;
  final TextSpec fallback;

  /// {@macro avatar_spec_of}
  static const of = _$AvatarSpec.of;

  static const from = _$AvatarSpec.from;

  const AvatarSpec({
    BoxSpec? container,
    ImageSpec? image,
    TextSpec? fallback,
    super.animated,
  })  : container = container ?? const BoxSpec(),
        image = image ?? const ImageSpec(),
        fallback = fallback ?? const TextSpec();
}
