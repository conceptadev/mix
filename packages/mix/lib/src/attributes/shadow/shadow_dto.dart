// ignore_for_file: prefer_relative_imports, avoid-importing-entrypoint-exports

import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'shadow_dto.g.dart';

sealed class ShadowMixImpl<T extends Shadow> extends Mixable<T> {
  final ColorMix? color;
  final Offset? offset;
  final double? blurRadius;

  const ShadowMixImpl({this.blurRadius, this.color, this.offset});
}

/// Represents a [Mixable] Data transfer object of [Shadow]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a [Shadow]
@MixableProperty()
class ShadowMix extends ShadowMixImpl<Shadow>
    with HasDefaultValue<Shadow>, _$ShadowMix {
  const ShadowMix({super.blurRadius, super.color, super.offset});

  @override
  Shadow get defaultValue => const Shadow();
}

/// Represents a [Mixable] Data transfer object of [BoxShadow]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[BoxShadow]
@MixableProperty()
class BoxShadowMix extends ShadowMixImpl<BoxShadow>
    with HasDefaultValue<BoxShadow>, _$BoxShadowMix {
  final double? spreadRadius;

  const BoxShadowMix({
    super.color,
    super.offset,
    super.blurRadius,
    this.spreadRadius,
  });

  @override
  BoxShadow get defaultValue => const BoxShadow();
}
